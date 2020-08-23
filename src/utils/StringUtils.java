package utils;

import model.Mode;
import org.jetbrains.annotations.NotNull;

public class StringUtils {
    @NotNull
    public static Mode getMode(@NotNull String mode) {
        switch (mode) {
            case "T":
                return Mode.T;
            case "S":
                return Mode.S;
            default:
                throw Error.combine(ErrorType.INVALID_MODE, mode);
        }
    }

}
