package terminalInterface;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.HashMap;

public abstract class Command {
    public enum Option {
        INPUT,
        OUTPUT,
    }

    private HashMap<Option, String> options;

    protected Command() {
        options = new HashMap<>();
    }

    public abstract int run();

    public String getOption(@NotNull Option option) {
        return options.getOrDefault(option, null);
    }

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
            switch (commandString) {
                case "read":
                    if (arguments.size() != 2) {
                        return new InvalidCommand();
                    } else {
                        Command readCommand = new ReadCommand();
                        readCommand.options.put(Option.INPUT, arguments.get(1));
                        return readCommand;
                    }
                case "translate":
                    if (arguments.size() != 3) {
                        return new InvalidCommand();
                    } else {
                        Command translateCommand = new TranslateCommand();
                        translateCommand.options.put(Option.INPUT, arguments.get(1));
                        return translateCommand;
                    }
                case "verify":
                    if (arguments.size() != 4) {
                        return new InvalidCommand();
                    } else {
                        Command verifyCommand = new VerifyCommand();
                        verifyCommand.options.put(Option.INPUT, arguments.get(1));
                        return verifyCommand;
                    }
                default:
                    return new InvalidCommand();
            }
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
