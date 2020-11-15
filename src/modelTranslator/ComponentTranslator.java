package modelTranslator;

import model.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

public class ComponentTranslator {

	public static String translate(Component component) {
		ArrayList<ReadAction> readActions = component.getAllReadActions();
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
							"\t:: %s -> %s;\n",
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
									"\t\t:: %s\n",
									transition
							)
					);
				}
				processBody.append("\t\tfi;\n");
			}
		}
		if (!noTriggers.isEmpty()) {
			for (Transition transition : noTriggers) {
				processBody.append(String.format("\t// NO TRIG TRANSITION %s\n", transition.getId()));
				processBody.append(String.format("\t:: %s\n", transition.toString()));
			}
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

	public static String translateParameters(Set<Parameter> parameters) {
		StringBuilder modelBuilder = new StringBuilder();
		for (Parameter parameter : parameters) {
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

	public static String translateChannels(Set<Channel> channels) {
		StringBuilder modelBuilder = new StringBuilder();
		for (Channel channel : channels) {
			modelBuilder.append(ChannelTranslator.translate(channel));
		}
		return modelBuilder.toString();
	}

	public static String translateInitials(Set<Parameter> parameters) {
		StringBuilder modelBuilder = new StringBuilder();
		for (Parameter parameter : parameters) {
			modelBuilder.append(
					String.format(
							"mtype %s=%s;\n",
							parameter.getName(),
							parameter.getName() + "_" + parameter.getInitial().getState().getName()
					)
			);
			if (parameter.getValueRange() != null) {
				modelBuilder.append(
						String.format(
								"int %s_value=%s;\n",
								parameter.getName(),
								parameter.getInitial().getValue()
						)
				);
			}
		}
		return modelBuilder.toString();
	}
}
