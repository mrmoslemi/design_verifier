package utils;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.Arrays;

public class Error extends IllegalStateException {
    @NotNull
    public static Error combine(@NotNull ErrorType errorType, @Nullable String... args) {
        if (args == null) {
            args = new String[1];
            args[0] = "NO ARGS";
        }
        return new Error(Error.getTitle(errorType) + " (" + Arrays.toString(args) + ")");
    }

    @NotNull
    private static String getTitle(@NotNull ErrorType errorType) {

        switch (errorType) {
            case EXPECTED_FOLDER:
                return "Expected a folder but received a file";
            case FILE_ACCESS_DENIED:
                return "Access denied to address";
            case BAD_PARAMETER_FILE:
                return "Given file can't be read";
            case COLUMN_MISSING:
                return "Column missing in parameter file";
            case INVALID_LINKAGE_TYPE:
                return "Linkage type should be input/output/internal/configs/const";
            case INVALID_VALUE_MEMBER:
                return "Invalid value member";
            case INVALID_MODE:
                return "Invalid Mode";
            case UNEXPECTED_EMPTY_CELL:
                return "Unexpected Empty Cell";
            case EVALUATION_ALL_NULL_ERROR:
                return "An evaluation should have at least one of its input parameters";
            case EVALUATION_MODE_STATE_ERROR:
                return "An evaluation should either have both state and mode or none of them";
            case INVALID_GUARD:
                return "Invalid gaurd";
            case INVALID_EFFECT:
                return "Invalid effect";
            default:
                return "Unknown Error";
        }
    }

    private Error(@NotNull String message) {
        super(message);
    }
}
