package verifier;

import de.learnlib.algorithms.malerpnueli.MalerPnueliDFA;
import de.learnlib.algorithms.malerpnueli.MalerPnueliDFABuilder;
import model.Action;
import model.Component;
import model.StringOracle;
import modelTranslator.ComponentTranslator;
import net.automatalib.words.Alphabet;
import net.automatalib.words.impl.FastAlphabet;

import java.util.ArrayList;

public class AutomataLearner {
	public static Automata init(Component component) {
		MalerPnueliDFABuilder<Action> builder = new MalerPnueliDFABuilder<>();

		ArrayList<Action> interfaceAlphabet = new ArrayList<>();
		interfaceAlphabet.addAll(component.getInputAlphabet());
		interfaceAlphabet.addAll(component.getOutputAlphabet());
		Alphabet<Action> alphabet = new FastAlphabet<>();
		alphabet.addAll(interfaceAlphabet);
		StringOracle oracle = new StringOracle(component);
		builder.setAlphabet(alphabet);
		builder.setOracle(oracle);
		MalerPnueliDFA<Action> a = builder.create();
		a.startLearning();
		System.out.println(ComponentTranslator.translate(component));
//        DFA<Integer, Action> dfa = (DFA<Integer, Action>) a.getHypothesisModel();
//        Collection<Integer> states = dfa.getStates();
//        for (Integer state : states) {
//            System.out.println(state);
//        }
		return null;
	}
}
