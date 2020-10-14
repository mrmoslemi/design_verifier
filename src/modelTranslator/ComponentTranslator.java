package modelTranslator;

import model.*;

import java.util.ArrayList;
import java.util.HashMap;

public class ComponentTranslator {

	public static String translate(Component component) {
		return translateParameters(component) +
				translateChannels(component) +
				translateInitials(component) +
				translateProcess(component);
	}

	public static String translateProcess(Component component) {
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
		StringBuilder processBody = new StringBuilder();
		for (ReadAction readAction : readActions) {
			processBody.append(
					String.format(
							"\n\n\t// TRIGGER\n\t::\n\t\t%s;%s;\n\n",
							readAction.toString(),
							readAction.getAssignment()
					)
			);
			ArrayList<Transition> transitions = body.get(readAction);
			if (!transitions.isEmpty()) {
				processBody.append("\t\tif\n");
				for (Transition transition : transitions) {
					processBody.append(String.format("\t\t// TRANSITION %s\n", transition.getId()));
					processBody.append(
							String.format(
									"\t\t::\n\t\t\t%s\n\n",
									transition
							)
					);
				}
				processBody.append("\t\tfi;\n");
			}
		}
		if (!noTriggers.isEmpty()) {
			StringBuilder noTriggersBody = new StringBuilder();
			for (Transition transition : noTriggers) {
				noTriggersBody.append(String.format("\t// NO TRIG TRANSITION %s\n", transition.getId()));
				noTriggersBody.append(String.format("\t\t\t%s\n", transition));
			}
			processBody.append(String.format("\t::if\n%s\tfi;\n", noTriggersBody));
		}

		return String.format(
				"\n\nactive proctype %s(){" +
						"\n\tdo\n" +
						"%s" +
						"\tod;\n};\n\n",
				component.getName(),
				processBody
		);
	}

	public static String translateParameters(Component component) {
		StringBuilder modelBuilder = new StringBuilder();
		for (Parameter parameter : component.getParameters()) {
			for (State state : parameter.getStates()) {
				modelBuilder.append(
						String.format("\t%s,\n", state)
				);
			}
		}
		modelBuilder.delete(modelBuilder.length() - 2, modelBuilder.length());
		return String.format(
				"mtype = {\n%s\n};\n",
				modelBuilder
		);
	}

	public static String translateChannels(Component component) {
		StringBuilder modelBuilder = new StringBuilder();
		for (Channel channel : component.getChannels()) {
			modelBuilder.append(ChannelTranslator.translate(channel));
		}
		return modelBuilder.toString();
	}

	public static String translateInitials(Component component) {
		StringBuilder modelBuilder = new StringBuilder();
		for (Parameter parameter : component.getParameters()) {
			modelBuilder.append(
					String.format(
							"mtype %s;\n",
							parameter.getName()
					)
			);
			if (parameter.getValueRange() != null) {
				modelBuilder.append(
						String.format(
								"int %s_value;\n",
								parameter.getName()
						)
				);
			}
		}
		return modelBuilder.toString();
	}
}
