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

	public static Mode getGuardMode(@NotNull String evaluationString) {
		String[] parts = evaluationString.split(", ");
		for (String part : parts) {
			if (RegexChecker.isMember(part)) {
				if (StringUtils.getMode(part.substring(0, 1)) == Mode.T) {
					return Mode.T;
				}
			}
		}
		return Mode.S;
	}

}
