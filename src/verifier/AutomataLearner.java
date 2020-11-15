package verifier;

import de.learnlib.algorithms.ttt.dfa.PrefixTTTLearnerDFA;
import de.learnlib.algorithms.lstar.dfa.ClassicLStarDFABuilder;
import de.learnlib.algorithms.rivestschapire.RivestSchapireDFA;
import de.learnlib.algorithms.rivestschapire.RivestSchapireDFABuilder;
import de.learnlib.algorithms.ttt.dfa.TTTLearnerDFA;
import de.learnlib.algorithms.ttt.dfa.TTTLearnerDFABuilder;
import de.learnlib.algorithms.ttt.dfa.TTTStateDFA;
import de.learnlib.api.query.DefaultQuery;
import model.*;
import net.automatalib.automata.fsa.DFA;
import net.automatalib.words.Alphabet;
import net.automatalib.words.WordBuilder;
import net.automatalib.words.impl.FastAlphabet;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

public class AutomataLearner {
	private static TTTLearnerDFA<Action> dfaLearner;
	private static Set<Action> alphabetSet;

	public static void init(Component component, Property property) {
		alphabetSet = new HashSet<>();
//		alphabetSet.addAll(component.getReadOnlyAlphabet());
		alphabetSet.addAll(property.getWriteAlphabet());
		alphabetSet.removeAll(component.getFeedbackActions());
		Alphabet<Action> alphabet = new FastAlphabet<>();
		alphabet.addAll(alphabetSet);
		StringOracle oracle = new StringOracle(component, property);
		TTTLearnerDFABuilder<Action> builder = new TTTLearnerDFABuilder<>();
		builder.setAlphabet(alphabet);
		builder.setOracle(oracle);
		dfaLearner = builder.create();
		dfaLearner.startLearning();

	}

	public static Property getConjecture() {
		DFA<TTTStateDFA<Integer>, Action> conjecture = (DFA<TTTStateDFA<Integer>, Action>) dfaLearner.getHypothesisModel();
		return Property.fromDFA(conjecture, alphabetSet);

	}

	public static void addCounterExample(String counterExample, Model model) {
		ArrayList<Action> actions = new ArrayList<>();
		String[] parts = counterExample.split("\n");
		for (String actionLine : parts) {
			String[] actionParts = actionLine.split("_cin!");
			String parameterName = actionParts[0];
			String stateName = actionParts[1].substring(parameterName.length() + 1);
			for (Action a : alphabetSet) {
				if (a.getChannel().getParameter().getName().equals(parameterName) && ((WriteAction) a).getState().getName().equals(stateName)) {
					actions.add(a);

				}
			}
		}
		WordBuilder<Action> wordBuilder = new WordBuilder<>();
		wordBuilder.addAll(actions);
		dfaLearner.refineHypothesis(new DefaultQuery<>(wordBuilder.toWord(),false));
	}
}
