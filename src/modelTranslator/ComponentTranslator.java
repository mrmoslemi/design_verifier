package modelTranslator;

import model.*;
import utils.Log;

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
			modelBuilder.append(ParameterTranslator.translate(parameter));
		}
		for (Channel channel : component.getChannels()) {
			modelBuilder.append(ChannelTranslator.translate(channel));
		}


		for (Parameter parameter : component.getParameters()) {
			String parameterName = parameter.getName();
			String parameterTypedefName = parameterName + "_states";
			modelBuilder.append(parameterTypedefName);
			modelBuilder.append(" ");
			modelBuilder.append(parameterName);
			modelBuilder.append(";\n");
			if (parameter.getValueRange() != null) {
				String parameterNameValue = parameterName + "_value";
				modelBuilder.append("int ");
				modelBuilder.append(parameterNameValue);
				modelBuilder.append(";\n");
			}
		}
		modelBuilder.append("\n\nactive proctype ");

		modelBuilder.append(getName(component));
		modelBuilder.append(" (){\n");
		modelBuilder.append("\tdo\n");
		ArrayList<Action> actions = component.getReadActions();
		HashMap<Action, ArrayList<Transition>> body = new HashMap<>();
		for (Action action : actions) {
			body.put(action, new ArrayList<>());
		}
		for (Transition transition : component.getTransitions()) {
			if(transition.getTrigger()!=null){
				body.get(transition.getTrigger()).add(transition);
			}else {
				Log.warning("transition passed");
			}

		}
		for (Action action : actions) {
			modelBuilder.append("\n\n\t// TRIGGER\n");
			modelBuilder.append("\t:: ").append(action).append("\n");
			ArrayList<Transition> transitions = body.get(action);
			if (!transitions.isEmpty()) {
				modelBuilder.append("\t\tif\n");
				for (Transition transition : transitions) {
					modelBuilder.append("\t\t// TRANSITION ").append(transition.getId()).append("\n");
					modelBuilder.append("\t\t:: ").append(transition).append("\n");
				}
				modelBuilder.append("\t\tfi;\n");
			}
		}
		modelBuilder.append("\tod;\n");
		modelBuilder.append("};\n\n");
		return modelBuilder.toString();
	}


	public static ArrayList<String> getInputInterfaceAlphabet(Component component) {
		ArrayList<String> actions = new ArrayList<>();
		for (Parameter parameter : component.getInputParameters()) {
//			actions.addAll(ParameterTranslator.getReadActions(parameter));
		}
		return actions;
	}

	public static ArrayList<String> getOutputInterfaceAlphabet(Component component) {
		ArrayList<String> actions = new ArrayList<>();
		for (Parameter parameter : component.getOutputParameters()) {
//			actions.addAll(ParameterTranslator.getWriteActions(parameter));
		}
		return actions;
	}
}
