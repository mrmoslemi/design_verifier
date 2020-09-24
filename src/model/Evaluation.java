package model;


import org.jetbrains.annotations.Nullable;


public class Evaluation {
	private State state;
	private Integer value;

	public Evaluation(@Nullable State state, @Nullable Integer value) {
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
		String toReturn = "(";

		if (this.state != null) {
			toReturn += state;
		} else {
			toReturn += "NA";
		}
		toReturn += ", ";
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
		if (o == null) {
			return false;
		}
		if (o instanceof Evaluation) {
			Evaluation otherEvaluation = (Evaluation) o;
			if ((otherEvaluation.state == null || this.state == null)
					&&
					!(otherEvaluation.state == null && this.state == null)) {
				return false;
			}
			if (this.state != null && !this.state.equals(otherEvaluation.state)) {
				return false;
			}
			if ((otherEvaluation.value == null || this.value == null)
					&&
					!(otherEvaluation.value == null && this.value == null)) {
				return false;
			}
			if (this.value != null && !this.value.equals(otherEvaluation.value)) {
				return false;
			}
			return true;
		} else {
			return false;
		}
	}


}
