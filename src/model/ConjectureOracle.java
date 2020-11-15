package model;

import modelTranslator.PropertyTranslator;
import modelTranslator.WordQueryTranslator;
import net.automatalib.words.Word;
import utils.Log;
import utils.Pair;
import verifier.Property;

import java.util.Set;

public class ConjectureOracle {
	private String base;
	private int round;
	private Component component;
	private Set<Action> alphabet;

	public ConjectureOracle(Component component, Property property, Set<Action> alphabet) {
		round = 0;
		this.component = component;
		this.base = OracleUtils.getBase(component, property);
		this.alphabet = alphabet;
	}


	public Pair<Boolean, Word<Action>> processConjecture(Property conjecture) {
		round++;
		String conjectureProcess = PropertyTranslator.translateAsProcess(conjecture);
		String unmatchedFromWord = WordQueryTranslator.getUnmatchedActionsProcess(conjecture.getWriteAlphabet(), component.getReadOnlyAlphabet());
		String modelCode = base + conjectureProcess + unmatchedFromWord;
		Pair<Boolean, String> result = OracleUtils.runSpin(getConjectureId(), modelCode);
		Pair<Boolean, Word<Action>> toReturn;
		if (result.first) {
			Log.success(getConjectureId() + "\ttrue\t");
			toReturn = new Pair<>(true, null);
		} else {
			Log.warning(getConjectureId() + "\tfalse\t");
			toReturn = new Pair<>(false, OracleUtils.runCounterEx(getConjectureId(), alphabet));
		}
		return toReturn;
	}


	private String getConjectureId() {
		return String.format("%s_c_%s", this.component.getName(), OracleUtils.normalizeInt(this.round));
	}


}
