package modelTranslator;

import model.*;
import net.automatalib.words.Word;

import java.util.List;

public class WordQueryTranslator {
	public static String translate(Word<Action> word) {
		StringBuilder body = new StringBuilder();
		for (Action action : word) {
			body.append(String.format("\t%s;\n", action));
		}
		return String.format("active proctype word(){\n%s}\n", body);
	}
}
