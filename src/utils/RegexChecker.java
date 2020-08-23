package utils;

import model.Evaluation;
import model.Mode;
import org.jetbrains.annotations.NotNull;

public class RegexChecker {
    public static final String MEMBER_REGEX = "[TS]_[a-zA-Z][a-zA-Z0-9_]*";
    public static final String RANGE_REGEX = "R_(0x[0-9a-fA-F]+|[0-9]+)-(0x[0-9a-fA-F]+|[0-9]+)";
    public static final String VALUE_REGEX = "V_(0x[0-9a-fA-F]+|[0-9]+)";

    public static Evaluation getEvaluation(@NotNull String evaluationString) {
        String[] parts = evaluationString.split(", ");
        Mode mode = null;
        Integer value = null;
        String state = null;
        for (String part : parts) {
            if (part.matches(MEMBER_REGEX)) {
                mode = StringUtils.getMode(part.substring(0, 1));
                state = part.substring(2);
            } else if (part.matches(VALUE_REGEX)) {
                value = IntegerParser.parseInt(part.substring(2));
            }
        }
        return new Evaluation(mode, state, value);
    }

    public static boolean isGuard(@NotNull String guardString) {
        String[] parts = guardString.split(", ");
        boolean hasMember = false, hasValue = false, hasRange = false;
        for (String part : parts) {
            if (isMember(part)) {
                if (hasMember) {
                    return false;
                } else {
                    hasMember = true;
                }
            } else if (isValue(part)) {
                if (hasValue) {
                    return false;
                } else {
                    hasValue = true;
                }
            } else if (isRange(part)) {
                if (hasRange) {
                    return false;
                } else {
                    hasRange = true;
                }
            } else {
                return false;
            }
        }
        return !hasValue || !hasRange;
    }

    public static boolean isRange(@NotNull String string) {
        return string.matches(RANGE_REGEX);
    }

    public static boolean isValue(@NotNull String string) {
        return string.matches(VALUE_REGEX);
    }

    public static boolean isMember(@NotNull String string) {
        return string.matches(MEMBER_REGEX);
    }
}
