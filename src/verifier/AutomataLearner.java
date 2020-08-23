package verifier;

import de.learnlib.algorithms.lstar.dfa.ClassicLStarDFABuilder;
import de.learnlib.algorithms.malerpnueli.MalerPnueliDFA;
import de.learnlib.algorithms.malerpnueli.MalerPnueliDFABuilder;
import de.learnlib.algorithms.rpni.BlueFringeRPNIDFA;
import de.learnlib.api.oracle.MembershipOracle;
import de.learnlib.api.query.Query;
import model.Component;
import modelTranslator.ComponentTranslator;
import net.automatalib.automata.fsa.DFA;
import net.automatalib.words.Alphabet;
import net.automatalib.words.Word;
import net.automatalib.words.impl.ArrayAlphabet;
import net.automatalib.words.impl.FastAlphabet;
import net.automatalib.words.impl.Symbol;

import java.util.ArrayList;

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
		MalerPnueliDFABuilder<Symbol> builder = new MalerPnueliDFABuilder<>();

		ArrayList<String> interfaceAlphabet = new ArrayList<>();
		interfaceAlphabet.addAll(ComponentTranslator.getInputInterfaceAlphabet(component));
		interfaceAlphabet.addAll(ComponentTranslator.getOutputInterfaceAlphabet(component));
		Alphabet<Symbol> alphabet = new FastAlphabet<>();
		for (String word : interfaceAlphabet) {
			alphabet.add(new Symbol(word));
		}
//		System.out.println(alphabet);
//		alphabet.addAll(interfaceAlphabet);
		MembershipOracle<Symbol, Boolean> membershipOracle = collection -> {
			for (Query<Symbol, Boolean> query : collection) {
				Word<Symbol> word = query.getInput();
//				System.out.println(word);
				query.answer(true);
			}
		};
		builder.setAlphabet(alphabet);
		builder.setOracle(membershipOracle);
		MalerPnueliDFA<Symbol> a = builder.create();
		a.startLearning();
//        DFA<Integer, String> dfa = (DFA<Integer, String>) a.getHypothesisModel();
//
//        Collection<Integer> states = dfa.getStates();
//        for (Integer state : states) {
//            System.out.println(state);
//        }
		return null;
	}

	public void learn(Trace trace) {
		//TODO
	}
}
