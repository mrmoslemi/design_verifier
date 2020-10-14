package verifier;

import de.learnlib.algorithms.lstar.dfa.ClassicLStarDFABuilder;
import de.learnlib.algorithms.malerpnueli.MalerPnueliDFA;
import de.learnlib.algorithms.malerpnueli.MalerPnueliDFABuilder;
import de.learnlib.algorithms.rpni.BlueFringeRPNIDFA;
import model.Action;
import model.Component;
import model.StringOracle;
import net.automatalib.automata.fsa.DFA;
import net.automatalib.words.Alphabet;
import net.automatalib.words.Word;
import net.automatalib.words.impl.ArrayAlphabet;
import net.automatalib.words.impl.FastAlphabet;

import java.util.ArrayList;
import java.util.Collection;

public class AutomataLearner {
	public Automata getAutomata() {
		ClassicLStarDFABuilder<Character> builder = new ClassicLStarDFABuilder<>();
		Alphabet<Character> alphabet = new ArrayAlphabet<>('a', 'b', 'c');
		BlueFringeRPNIDFA<Character> RPNI = new BlueFringeRPNIDFA<>(alphabet);
		Word<Character> accept = new Word<Character>() {
			@Override
			public int length() {
				return 3;
			}

			@Override
			public Character getSymbol(int i) {
				return 'a';
			}
		};
		Word<Character> accept2 = new Word<Character>() {
			@Override
			public int length() {
				return 2;
			}

			@Override
			public Character getSymbol(int i) {
				return 'a';
			}
		};
		Word<Character> reject = new Word<Character>() {
			@Override
			public int length() {
				return 3;
			}

			@Override
			public Character getSymbol(int i) {
				return 'b';
			}
		};
		RPNI.addSample(accept, true);
		RPNI.addSample(accept2, true);
		RPNI.addSample(reject, true);

		DFA<?, Character> dfa = RPNI.computeModel();
		return null;
	}

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
        DFA<Integer, Action> dfa = (DFA<Integer, Action>) a.getHypothesisModel();

        Collection<Integer> states = dfa.getStates();
        for (Integer state : states) {
            System.out.println(state);
        }
		return null;
	}

	public void learn(Trace trace) {
		//TODO
	}
}
