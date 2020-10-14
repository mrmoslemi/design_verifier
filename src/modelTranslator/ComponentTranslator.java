package modelTranslator;

import model.*;

import java.util.ArrayList;
import java.util.HashMap;

public class ComponentTranslator {
	private static HashMap<Component, String> translations;

	static {
		translations = new HashMap<>();
	}

	public static String translate(Component component) {
		if (translations.containsKey(component)) {
			return translations.get(component);
		}
		StringBuilder modelBuilder = new StringBuilder();
		modelBuilder.append(
				"mtype = {\n"
		);
		for (Parameter parameter : component.getParameters()) {
			modelBuilder.append(ParameterTranslator.translate(parameter));
			modelBuilder.append(",\n");
		}
		modelBuilder.delete(modelBuilder.length() - 2, modelBuilder.length());
		modelBuilder.append("\n}\n\n");
		for (Channel channel : component.getChannels()) {
			modelBuilder.append(ChannelTranslator.translate(channel));
		}


		for (Parameter parameter : component.getParameters()) {
			String parameterName = parameter.getName();
//			String parameterTypedefName = parameterName + "_states"; TODO
			String parameterTypedefName = "mtype";
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

		modelBuilder.append(component.getName());
		modelBuilder.append(" (){\n");
		modelBuilder.append("\tdo\n");
		ArrayList<ReadAction> readActions = component.getReadActions();
		HashMap<ReadAction, ArrayList<Transition>> body = new HashMap<>();
		ArrayList<Transition> noTriggers = new ArrayList<>();
		for (ReadAction action : readActions) {
			body.put(action, new ArrayList<>());
		}
		for (Transition transition : component.getTransitions()) {
			if (transition.getTrigger() != null) {
				body.get(transition.getTrigger()).add(transition);
			} else {
				noTriggers.add(transition);
			}

		}
		for (ReadAction readAction : readActions) {
			modelBuilder.append("\n\n\t// TRIGGER\n");
			modelBuilder.append("\t::\n\t\t");
			modelBuilder.append(
					String.format(
							"%s;%s;\n\n",
							readAction.toString(),
							readAction.getAssignment()
					)
			);
			ArrayList<Transition> transitions = body.get(readAction);
			if (!transitions.isEmpty()) {
				modelBuilder.append("\t\tif\n");
				for (Transition transition : transitions) {
					modelBuilder.append("\t\t// TRANSITION ").append(transition.getId()).append("\n");
					modelBuilder.append("\t\t::\n\t\t\t ").append(transition).append("\n");
				}
				modelBuilder.append("\t\tfi;\n");
			}
		}
		modelBuilder.append("\t::if\n");
		for (Transition transition : noTriggers) {
			modelBuilder.append("\t// NO TRIG TRANSITION ").append(transition.getId()).append("\n");
			modelBuilder.append("\t:: ").append(transition).append("\n");
		}
		modelBuilder.append("\tfi;\n");
		modelBuilder.append("\tod;\n");
		modelBuilder.append("};\n\n");
		modelBuilder.append(UniversalEnvironmentBuilder.buildFor(component));
		translations.put(component, modelBuilder.toString());
		return translate(component);
	}


}
