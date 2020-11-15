package modelTranslator;

import model.Action;
import model.WriteAction;
import net.automatalib.words.Word;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

public class WordQueryTranslator {
	public static String translate(Word<Action> word) {
		if (word.isEmpty()) {
			return "";
		} else {
			StringBuilder body = new StringBuilder();
			for (Action action : word) {
				body.append(String.format("\t%s;\n", action));
			}
			return String.format("active proctype word(){\n%s\n}\n", body);
		}

	}

	public static String getUnmatchedActionsProcess(Collection<Action> queryActions, Collection<Action> componentActions) {
		Set<Action> unmatchedActions = new HashSet<>(queryActions);
		unmatchedActions.removeAll(componentActions);
		StringBuilder body = new StringBuilder();
		for (Action action : unmatchedActions) {
			Action readAction = action.getChannel().getReadActionByState(((WriteAction)action).getState());
			body.append(String.format("\t:: %s;\n", readAction));
		}
		if (!unmatchedActions.isEmpty()) {
			return String.format("active proctype UnmatchedActions(){end: do\n%sod;\n}\n", body);
		} else {
			return "";
		}
	}
}
