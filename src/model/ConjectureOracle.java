package model;

import modelTranslator.PropertyTranslator;
import modelTranslator.WordQueryTranslator;
import utils.Log;
import utils.Pair;
import verifier.Property;

public class ConjectureOracle {
	private String base;
	private int round;
	private Component component;

	public ConjectureOracle(Component component, Property property) {
		round = 0;
		this.component = component;
		this.base = OracleUtils.getBase(component, property);
	}


	public Pair<Boolean, String> processConjecture(Property conjecture) {
		round++;
		String conjectureProcess = PropertyTranslator.translateAsProcess(conjecture);
		String unmatchedFromWord = WordQueryTranslator.getUnmatchedActionsProcess(conjecture.getWriteAlphabet(), component.getReadOnlyAlphabet());
		String modelCode = base + conjectureProcess + unmatchedFromWord;
		Pair<Boolean, String> result = OracleUtils.runSpin(getConjectureId(), modelCode);
		if (result.first) {
			Log.success(getConjectureId() + "\ttrue\t" + result.second);
		} else {
			Log.info(getConjectureId() + "\tfalse\t" + result.second);
			result.second = OracleUtils.runCounterEx(getConjectureId());
		}
		return result;
	}


	private String getConjectureId() {
		return String.format("%s_c_%s", this.component.getName(), OracleUtils.normalizeInt(this.round));
	}


}
