package modelTranslator;

import model.*;

public class UniversalEnvironmentBuilder {
	public static String buildFor(Component component) {
		StringBuilder bodyBuilder = new StringBuilder("");
		for (Parameter parameter : component.getInputParameters()) {
			Channel inputChannel = component.getInputChannel(parameter);
			for (State state : parameter.getStates()) {
				bodyBuilder.append(
						String.format(
								"\t::%s!%s;\n",
								inputChannel,
								state
						)
				);
			}
			bodyBuilder.append("\n");
		}
		bodyBuilder.append("\n");

		for (Parameter parameter : component.getOutputParameters()) {
			Channel inputChannel = component.getInputChannel(parameter);
			Channel outputChannel = component.getOutputChannel(parameter);
			for (State state : parameter.getStates()) {
				bodyBuilder.append(
						String.format(
								"\t::%s?%s;%s!%s;\n",
								outputChannel,
								state,
								inputChannel,
								state
						)
				);
			}
			bodyBuilder.append("\n");
		}

		return String.format(
				"active proctype %s_environment(){\n" +
						"\tdo\n" +
						"%s" +
						"\tod;\n" +
						"}\n",
				component.getName(), bodyBuilder.toString());
	}
}
