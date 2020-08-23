package modelTranslator;

import model.Parameter;

import java.util.ArrayList;

public class ParameterTranslator {
	public static String getName(Parameter parameter) {
		return parameter.getName().toLowerCase();
	}

	public static String getStatesName(Parameter parameter) {
		return String.format("%s_states", ParameterTranslator.getName(parameter));
	}

	public static String getChannelName(Parameter parameter) {
		String name = parameter.getName().toLowerCase();
		return String.format("%s_channel", name);
	}

	public static ArrayList<String> getStates(Parameter parameter) {
		String name = parameter.getName().toLowerCase();
		ArrayList<String> states = new ArrayList<>();
		for (String state : parameter.getStates()) {
			String stateName = state.toLowerCase();
			states.add(String.format("%s_%s", name, stateName));
		}
		return states;
	}


	public static String getStatesDefinition(Parameter parameter) {
		StringBuilder modelBuilder = new StringBuilder();
		modelBuilder.append(String.format("mtype:%s = {\n", ParameterTranslator.getStatesName(parameter)));
		for (String state : ParameterTranslator.getStates(parameter)) {
			modelBuilder.append(String.format("\t%s,\n", state));
		}
		if (!parameter.getStates().isEmpty()) {
			modelBuilder.delete(modelBuilder.length() - 2, modelBuilder.length());
		}
		modelBuilder.append("\n};\n\n");
		return modelBuilder.toString();
	}

	public static String getChannelDefinition(Parameter parameter) {
		return String.format(
				"chan %s = [0] of {mtype:%s};\n\n",
				ParameterTranslator.getChannelName(parameter),
				ParameterTranslator.getStatesName(parameter)
		);
	}

	public static ArrayList<String> getReadActions(Parameter parameter) {
		ArrayList<String> actions = new ArrayList<>();
		for (String state : ParameterTranslator.getStates(parameter)) {
			String action = String.format("%s?%s;\n", ParameterTranslator.getChannelName(parameter), state);
			actions.add(action);
		}
		return actions;
	}

	public static ArrayList<String> getWriteActions(Parameter parameter) {
		ArrayList<String> actions = new ArrayList<>();
		for (String state : ParameterTranslator.getStates(parameter)) {
			String action = String.format("%s!%s;\n", ParameterTranslator.getChannelName(parameter), state);
			actions.add(action);
		}
		return actions;
	}

	public static ArrayList<String> getActions(Parameter parameter) {
		ArrayList<String> actions = new ArrayList<>();
		actions.addAll(ParameterTranslator.getReadActions(parameter));
		actions.addAll(ParameterTranslator.getWriteActions(parameter));
		return actions;
	}
}
