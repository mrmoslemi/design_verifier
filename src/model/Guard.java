package model;


import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import utils.*;
import utils.Error;

import java.util.ArrayList;


public class Guard {
	private Parameter parameter;
	private Mode mode;
	private State state;
	private ValueRange valueRange;
	private Integer value;

	public Guard(Parameter parameter, String stringValue) {
		this.parameter = parameter;
		String[] parts = stringValue.split(", ");
		for (String part : parts) {
			if (RegexChecker.isMember(part)) {
				this.mode = StringUtils.getMode(part.substring(0, 1));
				this.state = parameter.getStateByName(part.substring(2));
			} else if (RegexChecker.isValue(part)) {
				this.value = IntegerParser.parseInt(part.substring(2));
			} else if (RegexChecker.isRange(part)) {
				this.valueRange = new ValueRange(part);
			}
		}
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
	public State getState() {
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
			String stateGuard = parameterName + " == " + this.getState();
			parameterGuards.add(stateGuard);
		}
		if (this.getValueRange() != null) {
			String minGuard = parameterName + "_value >= " + this.getValueRange().getMin();
			String maxGuard = parameterName + "_value <= " + this.getValueRange().getMax();
			parameterGuards.add(minGuard);
			parameterGuards.add(maxGuard);
		}
		if (this.getValue() != null) {
			String valueGuard = parameterName + "_value == " + this.getValue();
			parameterGuards.add(valueGuard);
		}
		StringBuilder toReturn = new StringBuilder();
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
