package model;


import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;


public class Evaluation {
	private State state;
	private Integer value;

	public Evaluation(@NotNull State state, @Nullable Integer value) {
		this.state = state;
		this.value = value;
	}

	@Nullable
	public State getState() {
		return this.state;
	}

	@Nullable
	public Integer getValue() {
		return this.value;
	}

	@Override
	public String toString() {
		String toReturn = "(" + this.state + ", ";
		if (this.value != null) {
			toReturn += this.value;
		} else {
			toReturn += "e";
		}
		toReturn += ")";
		return toReturn;
	}

	@Override
	public boolean equals(Object o) {
		if (o instanceof Evaluation) {
			Evaluation otherEvaluation = (Evaluation) o;
			boolean equal = this.state.equals(otherEvaluation.state);
			if (this.value != null) {
				equal = this.value.equals(otherEvaluation.value) && equal;
			}
			return equal;
		} else {
			return false;
		}
	}


}
