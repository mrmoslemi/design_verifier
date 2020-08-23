package model;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

public class Parameter implements TransitionContainer {
	private String name;
	private Set<String> states;
	private ValueRange valueRange;
	private Evaluation initial;
	private ArrayList<Transition> transitions;

	public Parameter(@NotNull String name) {
		this.name = name;
		this.states = new HashSet<>();
		this.transitions = new ArrayList<>();
	}

	public void addState(String state) {
		this.states.add(state);
	}

	public void setValueRange(ValueRange valueRange) {
		this.valueRange = valueRange;
	}


	public void setInitial(Evaluation initial) {
		this.states.add(initial.getState());
		this.initial = initial;

	}

	public void addTransition(Transition transition) {
		this.transitions.add(transition);
	}

	@Override
	public ArrayList<Parameter> getParameters() {
		ArrayList<Parameter> toReturn = new ArrayList<>();
		toReturn.add(this);
		return toReturn;
	}

	public String getName() {
		return this.name;
	}


	public Set<String> getStates() {
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

	public ArrayList<Transition> getTransitions() {
		return this.transitions;
	}


	@Override
	public String toString() {
		String toReturn = "Parameter:\n";
		toReturn += "\tNAME:\t\t\t" + this.name + "\n";
		if (!this.states.isEmpty()) {
			toReturn += "\tSTATES:\t\t\t" + this.states + "\n";
		}
		if (this.valueRange != null) {
			toReturn += "\tVALUE RANGE:\t" + this.valueRange + "\n";
		}
		toReturn += "\tINITIAL:\t\t" + this.initial + "\n\n";
		return toReturn;
	}

}
