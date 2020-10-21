package model;

import de.learnlib.api.oracle.MembershipOracle;
import de.learnlib.api.query.Query;
import modelTranslator.WordQueryTranslator;
import net.automatalib.words.Word;

import java.util.Collection;

public class StringOracle implements MembershipOracle<Action, Boolean> {
	private Component component;
	private MembershipOracle<Action, Boolean> oracle;

	public StringOracle(Component component) {
		this.component = component;
		this.oracle = collection -> {
			for (Query<Action, Boolean> query : collection) {
				Word<Action> word = query.getInput();
				String wordProcess = WordQueryTranslator.translate(word);
//				System.out.println(wordProcess);
				query.answer(false);
			}
		};
	}

	@Override
	public void processQueries(Collection collection) {
		this.oracle.processQueries(collection);
	}
}
