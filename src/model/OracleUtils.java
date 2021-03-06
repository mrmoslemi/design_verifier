package model;

import modelTranslator.ComponentTranslator;
import modelTranslator.PropertyTranslator;
import net.automatalib.words.Word;
import net.automatalib.words.WordBuilder;
import utils.Pair;
import verifier.Property;

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

public class OracleUtils {

	public static String getBase(Component component, Property property) {
		Set<Parameter> parameters = new HashSet<>();
		parameters.addAll(component.getParameters());
		parameters.addAll(property.getParameters());
		Set<Channel> channels = new HashSet<>();
		channels.addAll(component.getAllChannels());
		channels.addAll(property.getChannels());
		String parametersDefinition = ComponentTranslator.translateParameters(parameters);
		String channelsDefinition = ComponentTranslator.translateChannels(channels);
		String inits = ComponentTranslator.translateInitials(parameters);
		String componentProcess = ComponentTranslator.translate(component);
		String propertyTrace = PropertyTranslator.translateAsTrace(property);
		//	private Set<Action> unconditionedActions;
		Set<Pair<Action, Action>> conditionedActions = new HashSet<>();
		for (Action condition : component.getOutputAlphabet()) {
			Channel channel = null;
			for (Channel c : component.getFeedbackChannels()) {
				if (c.getParameter() == condition.getChannel().getParameter()) {
					channel = c;
				}
			}
			assert channel != null;
			Action result = channel.getWriteActionByState(((ReadAction) condition).getState());
			conditionedActions.add(new Pair<>(condition, result));
		}
		StringBuilder feedback = new StringBuilder();
		for (Pair<Action, Action> conditionedAction : conditionedActions) {
			feedback.append(String.format("\t::%s -> %s;\n", conditionedAction.first, conditionedAction.second));
		}
		String env = String.format("active proctype UniversalEnvironment(){\ndo\n%sod;\n}\n", feedback);
		return parametersDefinition + channelsDefinition + inits + componentProcess + env + propertyTrace;
	}

	public static Pair<Boolean, String> runSpin(String fileName, String modelCode) {
		String modelAddress = String.format("output/cases/%s", fileName);
		try {
			FileWriter caseCreator = new FileWriter(modelAddress);
			caseCreator.write(modelCode);
			caseCreator.flush();
			caseCreator.close();
			Process process = Runtime.getRuntime().exec(String.format(" ./scripts/spinCheck.sh %s", fileName));
			process.waitFor();
			Scanner scanner = new Scanner(process.getInputStream());

			String answerString = scanner.nextLine();
			boolean answer;
			if (answerString.contains("no matching event")) {
				answerString = "trace not matched";
				answer = false;
			} else if (answerString.contains("invalid end state")) {
				answerString = "invalid end state";
				answer = true;
			} else if (answerString.contains("syntax error")) {
				throw new IllegalStateException(answerString);
			} else {
				answer = true;
			}
			return new Pair<>(answer, answerString);
		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
			throw new IllegalStateException("done");
		}
	}

	public static Word<Action> runCounterEx(String fileName,Set<Action> alphabetSet) {
		try {
			Process process = Runtime.getRuntime().exec(String.format(" ./scripts/counterexCheck.sh %s", fileName));
			process.waitFor();
			Scanner scanner = new Scanner(process.getInputStream());
			StringBuilder toReturn = new StringBuilder();
			while (scanner.hasNextLine()) {
				String line = scanner.nextLine();
				if (line.contains("_cin!")) {
					String action = line.substring(line.indexOf("[") + 1, line.indexOf("]"));
					toReturn.append(action).append("\n");
				}
				if (line.contains("spin: trail ends")) {
					break;
				}
			}
			ArrayList<Action> actions = new ArrayList<>();
			String[] parts = toReturn.toString().split("\n");
			for (String actionLine : parts) {
				String[] actionParts = actionLine.split("_cin!");
				String parameterName = actionParts[0];
				String stateName = actionParts[1].substring(parameterName.length() + 1);
				for (Action a : alphabetSet) {
					if (a.getChannel().getParameter().getName().equals(parameterName) && ((WriteAction) a).getState().getName().equals(stateName)) {
						actions.add(a);

					}
				}
			}
			WordBuilder<Action> wordBuilder = new WordBuilder<>();
			wordBuilder.addAll(actions);
			return wordBuilder.toWord();
		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
			throw new IllegalStateException("done");
		}
	}


	public static String normalizeInt(int i) {
		if (i < 10) {
			return "00" + i;
		} else if (i < 100) {
			return "0" + i;
		} else {
			return "" + i;
		}
	}

}
