package modelTranslator;

import model.Component;
import model.Parameter;
import model.Transition;
import utils.Pair;

import java.util.ArrayList;
import java.util.HashMap;

public class ComponentTranslator {
	public static String getName(Component component) {
		return component.getName().toLowerCase();
	}

	public static String translate(Component component) {
		StringBuilder modelBuilder = new StringBuilder();
		modelBuilder.append("#define N 12\n\n");
		for (Parameter parameter : component.getParameters()) {
			modelBuilder.append(ParameterTranslator.getStatesDefinition(parameter));
			modelBuilder.append(ParameterTranslator.getChannelDefinition(parameter));
			modelBuilder.append("\n");
		}

		modelBuilder.append("\n\nactive proctype ");

		modelBuilder.append(getName(component));
		modelBuilder.append(" (){\n");
		for (Parameter parameter : component.getParameters()) {
			String parameterName = parameter.getName().toLowerCase();
			String parameterTypedefName = parameterName + "_states";
			modelBuilder.append("\t");
			modelBuilder.append(parameterTypedefName);
			modelBuilder.append(" ");
			modelBuilder.append(parameterName);
			modelBuilder.append(";\n");
			if (parameter.getValueRange() != null) {
				String parameterNameValue = parameterName + "_value";
				modelBuilder.append("\tint ");
				modelBuilder.append(parameterNameValue);
				modelBuilder.append(";\n");
			}
		}
		ArrayList<Transition> transitions = component.getTransitions();
		modelBuilder.append("\tdo\n");
		HashMap<String, ArrayList<String>> toWrite = new HashMap<>();

		for (Transition transition : transitions) {
			if (transition.getType().equals(Transition.Type.SYNC)) {
				Pair<String, String> result = TransitionTranslator.translate(transition);
				ArrayList<String> arrayList = toWrite.getOrDefault(result.first, new ArrayList<>());
				arrayList.add(result.second);
				toWrite.put(result.first, arrayList);
			}
		}
		for (Parameter parameter : component.getOutputParameters()) {
			for (Transition transition : parameter.getTransitions()) {
				if (transition.getType().equals(Transition.Type.SYNC)) {
					Pair<String, String> result = TransitionTranslator.translate(transition);
					ArrayList<String> arrayList = toWrite.getOrDefault(result.first, new ArrayList<>());
					arrayList.add(result.second);
					toWrite.put(result.first, arrayList);
				}

			}
		}
		for (String key : toWrite.keySet()) {
			ArrayList<String> arrayList = toWrite.get(key);
			modelBuilder.append("\t::");
			if (key != null) {
				modelBuilder.append(key);
			}
			modelBuilder.append("\n");
			modelBuilder.append("\t\tif\n");
			for (String item : arrayList) {
				modelBuilder.append("\t\t");
				modelBuilder.append(item);
			}
			modelBuilder.append("\t\tfi;\n");
		}

		modelBuilder.append("\tod;\n");
		modelBuilder.append("};\n\n");
		return modelBuilder.toString();
	}


	public static ArrayList<String> getInputInterfaceAlphabet(Component component) {
		ArrayList<String> actions = new ArrayList<>();
		for (Parameter parameter : component.getInputParameters()) {
			actions.addAll(ParameterTranslator.getReadActions(parameter));
		}
		return actions;
	}

	public static ArrayList<String> getOutputInterfaceAlphabet(Component component) {
		ArrayList<String> actions = new ArrayList<>();
		for (Parameter parameter : component.getOutputParameters()) {
			actions.addAll(ParameterTranslator.getWriteActions(parameter));
		}
		return actions;
	}
}
