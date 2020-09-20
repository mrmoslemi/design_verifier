package model;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import utils.IntegerParser;
import utils.RegexChecker;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

public class Parameter {
	private String name;
	private Set<State> states;
	private ValueRange valueRange;
	private Evaluation initial;
	private Channel inputChannel, outputChannel;

	public Parameter(@NotNull String name) {
		this.name = name;
		this.states = new HashSet<>();
		this.inputChannel = new Channel(this, Channel.Type.in);
		this.outputChannel = new Channel(this, Channel.Type.out);
	}

	public void addState(String state) {
		this.states.add(new State(this, state));
	}

	public void setValueRange(ValueRange valueRange) {
		this.valueRange = valueRange;
	}


	public void setInitial(Evaluation initial) {
		this.initial = initial;

	}

	public ArrayList<Parameter> getParameters() {
		ArrayList<Parameter> toReturn = new ArrayList<>();
		toReturn.add(this);
		return toReturn;
	}

	public String getName() {
		return this.name;
	}


	public Set<State> getStates() {
		return this.states;
	}

	@Nullable
	public ValueRange getValueRange() {
		return this.valueRange;
	}

	@NotNull
	public Evaluation getInitial() {
		return this.initial;
	}


	@Override
	public String toString() {
		return "P<" + this.name + ", " + this.states + ", " + this.valueRange + this.initial + ">";
	}

	public Channel getInputChannel() {
		return inputChannel;
	}

	public Channel getOutputChannel() {
		return outputChannel;
	}

	public ArrayList<Evaluation> getEval() {
		ArrayList<Evaluation> toReturn = new ArrayList<>();
		for (State state : this.states) {
			if (this.valueRange == null) {
				toReturn.add(new Evaluation(state, null));

			} else {
				for (int i = this.valueRange.getMin(); i <= this.valueRange.getMax(); i++) {
					toReturn.add(new Evaluation(state, i));
				}
			}
		}
		return toReturn;
	}

	public Evaluation getEvaluation(String evaluationString) {

		String[] parts = evaluationString.split(", ");
		Integer value = null;
		String state = null;
		for (String part : parts) {
			if (RegexChecker.isMember(part)) {
				state = part.substring(2);
			} else if (RegexChecker.isValue(part)) {
				value = IntegerParser.parseInt(part.substring(2));
			}
		}
		for (Evaluation evaluation : this.getEval()) {
			if (state != null && state.equals(evaluation.getState().getName())) {
				return evaluation;
			}
			if (value != null && value.equals(evaluation.getValue())) {
				return evaluation;
			}
		}
		return null;
	}

	public Evaluation getRawEvaluation(String evaluationString) {
		Evaluation evaluation = getEvaluation(evaluationString);
		return new Evaluation(evaluation.getState(), null);
	}
}
