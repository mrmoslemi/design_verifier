package modelTranslator;

import model.Parameter;
import model.State;

public class ParameterTranslator {
	public static String translate(Parameter parameter) {
		StringBuilder modelBuilder = new StringBuilder();
		modelBuilder.append(
				String.format(
						"mtype:%s_states = {\n",
						parameter.getName()
				)
		);
		for (State state : parameter.getStates()) {
			modelBuilder.append(
					String.format("\t%s,\n", state)
			);
		}
		if (!parameter.getStates().isEmpty()) {
			modelBuilder.delete(modelBuilder.length() - 2, modelBuilder.length());
		}
		modelBuilder.append("\n};\n\n");
		return modelBuilder.toString();
	}
}
