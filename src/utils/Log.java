package utils;

import org.jetbrains.annotations.NotNull;

public class Log {
    public static final String ANSI_RESET = "\u001B[0m";
    public static final String ANSI_BLACK = "\u001B[30m";
    public static final String ANSI_RED = "\u001B[31m";
    public static final String ANSI_GREEN = "\u001B[32m";
    public static final String ANSI_YELLOW = "\u001B[33m";
    public static final String ANSI_BLUE = "\u001B[34m";
    public static final String ANSI_PURPLE = "\u001B[35m";
    public static final String ANSI_CYAN = "\u001B[36m";
    public static final String ANSI_WHITE = "\u001B[37m";

    public static void info(@NotNull String message) {
        Log.log(ANSI_CYAN, "INFO\t", message);
    }

    public static void info(@NotNull Object message) {
        Log.log(ANSI_CYAN, "INFO\t", message.toString());
    }

    public static void success(@NotNull String message) {
        Log.log(ANSI_GREEN, "SUCCESS\t", message);
    }

    public static void error(@NotNull String message) {
        Log.log(ANSI_RED, "ERROR\t", message);
    }

    public static void warning(@NotNull String message) {
        Log.log(ANSI_YELLOW, "WARNING\t", message);
    }

    private static void log(@NotNull String color, @NotNull String prefix, @NotNull String message) {
        System.out.println(color + prefix + ":\t" + message + ANSI_RESET);
    }
}
