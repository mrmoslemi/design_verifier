package verifier;

import de.learnlib.algorithms.lstar.dfa.ClassicLStarDFA;
import de.learnlib.algorithms.lstar.dfa.ClassicLStarDFABuilder;
import de.learnlib.api.query.DefaultQuery;
import model.Action;
import model.Component;
import model.ConjectureOracle;
import model.StringOracle;
import net.automatalib.automata.fsa.DFA;
import net.automatalib.words.Alphabet;
import net.automatalib.words.Word;
import net.automatalib.words.impl.FastAlphabet;
import utils.Pair;

import java.util.HashSet;
import java.util.Set;

public class AssumptionLearner {
	private ClassicLStarDFA<Action> dfaLearner;
	public Set<Action> learningAlphabet;
	private ConjectureOracle conjectureOracle;
	private Word<Action> violation;
	private int totalConjectures = 0;
	private int totalMemberships = 0;

	public void addMembershipCount(int newQueries) {
		this.totalMemberships += newQueries;
	}

	public AssumptionLearner(Component component, Property property) {
		this.learningAlphabet = AssumptionLearner.getLearningAlphabet(component, property);
		Alphabet<Action> fastAlphabet = new FastAlphabet<>();
		fastAlphabet.addAll(learningAlphabet);
		StringOracle stringOracle = new StringOracle(component, property, this);
		ClassicLStarDFABuilder<Action> builder = new ClassicLStarDFABuilder<>();
		builder.setAlphabet(fastAlphabet);
		builder.setOracle(stringOracle);
		dfaLearner = builder.create();
		dfaLearner.startLearning();
		this.conjectureOracle = new ConjectureOracle(component, property, learningAlphabet);


	}


	public Property getCandidateAssumption() {
		DFA<Integer, Action> conjecture = (DFA<Integer, Action>) dfaLearner.getHypothesisModel();
		return Property.fromDFA(conjecture, learningAlphabet);
	}

	public Property getAssumption() {
		do {
			Property candidateAssumption = this.getCandidateAssumption();
			this.totalConjectures++;
			Pair<Boolean, Word<Action>> result = conjectureOracle.processConjecture(candidateAssumption);
			this.violation = result.second;
			if (result.first) {
				return candidateAssumption;
			} else {
				boolean newInformation = this.addCounterExample(result.second);
				if (!newInformation) {
					return null;
				}
			}
		} while (true);

	}

	public Word<Action> getViolation() {
		return this.violation;
	}

	private boolean addCounterExample(Word<Action> counterExample) {
		return dfaLearner.refineHypothesis(new DefaultQuery<>(counterExample, false));
	}

	public static Set<Action> getLearningAlphabet(Component component, Property property) {
		Set<Action> learningAlphabet = new HashSet<>();
		learningAlphabet.addAll(component.getReadOnlyAlphabet());
		learningAlphabet.addAll(property.getWriteAlphabet());
		learningAlphabet.removeAll(component.getFeedbackActions());
		return learningAlphabet;
	}

	public static int calculateFriendliness(Component component, Property property) {
		Set<Action> propertyAlphabet = new HashSet<>(property.getWriteAlphabet());
		Set<Action> feedbackActions = new HashSet<>(component.getFeedbackActions());
		Set<Action> commonActions = new HashSet<>();
		for (Action action : propertyAlphabet) {
			if (feedbackActions.contains(action)) {
				commonActions.add(action);
			}
		}
		return commonActions.size();
	}

	public int getTotalMemberships() {
		return totalMemberships;
	}

	public int getTotalConjectures() {
		return totalConjectures;
	}
}
