package model;

import java.util.ArrayList;

public class Channel {
	public enum Type {
		in, out
	}

	private Parameter parameter;
	private Type type;
	private ArrayList<Action> actions;

	public Channel(Parameter parameter, Type type) {
		this.parameter = parameter;
		this.type = type;
	}

	public Parameter getParameter() {
		return this.parameter;
	}

	public ArrayList<Action> getActions() {
		if (actions == null) {
			actions = new ArrayList<>();
			if (this.type == Type.in) {
				for (State state : parameter.getStates()) {
					Action action = new ReadAction(this, state);
					actions.add(action);
				}
			} else {
				for (Evaluation evaluation : parameter.getEval()) {
					Action action = new WriteAction(this, evaluation);
					actions.add(action);
				}
			}
		}
		return this.actions;
	}

	public Action getActionByState(State state) {
		for (Action action : this.getActions()) {
			if (action instanceof ReadAction) {
				if (((ReadAction) action).getState().equals(state)) {
					return action;
				}
			}

		}
		return null;
	}

	public Action getActionByEvaluation(Evaluation evaluation) {
		for (Action action : this.getActions()) {
			if (action instanceof WriteAction) {
				if (((WriteAction) action).getEvaluation().equals(evaluation)) {
					return action;
				}
			}

		}
		return null;
	}

	@Override
	public String toString() {
		return this.parameter.getName() + "_" + (this.type == Type.in ? "cin" : "cout");
	}
}
