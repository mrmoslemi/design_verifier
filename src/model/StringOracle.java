package model;

import de.learnlib.api.oracle.MembershipOracle;
import de.learnlib.api.query.Query;
import modelTranslator.WordQueryTranslator;
import net.automatalib.words.Word;
import utils.Log;
import utils.Pair;
import verifier.Property;

import java.util.Collection;

public class StringOracle implements MembershipOracle<Action, Boolean> {
	private String base;
	private Component component;
	private int round;

	public StringOracle(Component component, Property property) {
		this.component = component;
		round = 0;
		this.base = OracleUtils.getBase(component, property);

	}

	@Override
	public void processQueries(Collection collection) {
		int i = 0;
		round++;
		for (Object queryObject : collection) {
			i++;
			Query<Action, Boolean> query = (Query<Action, Boolean>) queryObject;
			Word<Action> word = query.getInput();
			String wordProcess = WordQueryTranslator.translate(word);
			String unmatchedFromWord = WordQueryTranslator.getUnmatchedActionsProcess(word.asList(), component.getReadOnlyAlphabet());
			Pair<Boolean, String> result = OracleUtils.runSpin(getQueryId(i), base + wordProcess + unmatchedFromWord);
			query.answer(result.first);
			StringBuilder wordCompact = new StringBuilder();
			for (Action action : word) {
				wordCompact.append(action.getChannel().getParameter().getName()).append(".").append(((WriteAction) action).getState().getName()).append(", ");
			}
			if (wordCompact.length() > 0) {
				wordCompact.setLength(wordCompact.length() - 2);
			}
			if (result.first) {
				Log.success(getQueryId(i) + "\ttrue\t" + result.second + "\t" + wordCompact);
			} else {
				Log.info(getQueryId(i) + "\tfalse\t" + result.second + "\t" + wordCompact);
			}
		}
	}

	private String getQueryId(int i) {
		return component.getName() + "_mq_" + OracleUtils.normalizeInt(this.round) + "_" + OracleUtils.normalizeInt(i);
	}
}
