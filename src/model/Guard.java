package model;


import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import utils.*;
import utils.Error;

import java.util.ArrayList;


public class Guard {
	private Parameter parameter;
	private String stringValue;
	private Mode mode;
	private String state;
	private ValueRange valueRange;
	private Integer value;

	public Guard(Parameter parameter, String stringValue) {
		this.parameter = parameter;
		this.stringValue = stringValue;
		String[] parts = stringValue.split(", ");
		for (String part : parts) {
			if (RegexChecker.isMember(part)) {
				this.mode = StringUtils.getMode(part.substring(0, 1));
				this.state = part.substring(2);
			} else if (RegexChecker.isValue(part)) {
				this.value = IntegerParser.parseInt(part.substring(2));
			} else if (RegexChecker.isRange(part)) {
				this.valueRange = new ValueRange(part);
			}
		}
	}

	public Guard(@Nullable Mode mode, @Nullable String state, @Nullable Integer value) {
		this(mode, state, null, value);
	}

	private Guard(@Nullable Mode mode, @Nullable String state, @Nullable ValueRange valueRange, @Nullable Integer value) {
		if ((mode == null && state != null) || (mode != null && state == null)) {
			throw Error.combine(ErrorType.EVALUATION_MODE_STATE_ERROR, mode + "", state + "");
		}
		if (mode == null && valueRange == null && value == null) {
			throw Error.combine(ErrorType.EVALUATION_ALL_NULL_ERROR);
		}
		this.mode = mode;
		this.state = state;
		this.valueRange = valueRange;
		this.value = value;
	}

	@NotNull
	public Parameter getParameter() {
		return this.parameter;
	}

	@Nullable
	public Mode getMode() {
		return this.mode;
	}

	@Nullable
	public String getState() {
		return this.state;
	}

	@Nullable
	public ValueRange getValueRange() {
		return this.valueRange;
	}

	@Nullable
	public Integer getValue() {
		return this.value;
	}

	@Override
	public String toString() {
		ArrayList<String> parameterGuards = new ArrayList<>();
		String parameterName = this.parameter.getName().toLowerCase();
		if (this.getState() != null) {
			String stateName = parameterName + "_" + this.getState().toLowerCase();
			String stateGuard = parameterName + ".state == " + stateName;
			parameterGuards.add(stateGuard);
		}
		if (this.getValueRange() != null) {
			String minGuard = parameterName + ".value >= " + this.getValueRange().getMin();
			String maxGuard = parameterName + ".value <= " + this.getValueRange().getMax();
			parameterGuards.add(minGuard);
			parameterGuards.add(maxGuard);
		}
		if (this.getValue() != null) {
			String valueGuard = parameterName + ".value == " + this.getValue();
			parameterGuards.add(valueGuard);
		}
		StringBuilder toReturn = new StringBuilder("(");
		for (String guard : parameterGuards) {
			toReturn.append("(").append(guard).append(")").append(" && ");
		}
		toReturn.delete(toReturn.length() - 4, toReturn.length());
		return toReturn.toString();
	}

	@Override
	public boolean equals(Object o) {
		if (o instanceof Guard) {
			Guard otherEvaluation = (Guard) o;
			boolean equal = true;
			if (this.state != null) {
				equal = this.state.equals(otherEvaluation.state);
			}
			if (this.valueRange != null) {
				equal = this.valueRange.equals(otherEvaluation.valueRange) && equal;
			}
			return equal;
		} else {
			return false;
		}
	}


}
