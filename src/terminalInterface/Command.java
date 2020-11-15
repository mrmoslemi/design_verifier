package terminalInterface;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.HashMap;

public abstract class Command {


	public abstract int run();

	@NotNull
	public static Command getCommand(@Nullable String[] args) {
		ArrayList<String> arguments = Command.trimArguments(args);

		if (arguments.size() == 0) {
			return new HelpCommand();
		} else if (arguments.size() == 1) {
			String argument = arguments.get(0).toLowerCase();
			switch (argument) {
				case "v":
				case "version":
					return new VersionCommand();
				case "h":
				case "help":
					return new HelpCommand();
				default:
					return new InvalidCommand();
			}
		} else {
			String commandString = arguments.get(0).toLowerCase();
			if ("verify".equals(commandString)) {
				if (arguments.size() == 3) {
					return new VerifyCommand(arguments.get(1), arguments.get(2), "max");
				} else if (arguments.size() == 4) {
					return new VerifyCommand(arguments.get(1), arguments.get(2),arguments.get(3));
				} else {
					return new InvalidCommand();
				}
			}
			return new InvalidCommand();
		}
	}

	@NotNull
	private static ArrayList<String> trimArguments(@Nullable String[] args) {
		ArrayList<String> arguments = new ArrayList<>();
		if (args == null) {
			args = new String[0];
		}
		for (String arg : args) {
			if (arg == null) {
				arg = "";
			}
			if (arg.startsWith("--")) {
				arg = arg.substring(2);
			} else if (arg.startsWith("-")) {
				arg = arg.substring(1);
			}
			arguments.add(arg);
		}
		return arguments;
	}


}
