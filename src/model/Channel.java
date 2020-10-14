package model;

import java.util.ArrayList;

public class Channel {
	public enum Type {
		in, out
	}

	private Parameter parameter;
	private Type type;
	private ArrayList<EvaluatedWriteAction> fullWriteActions;
	private ArrayList<WriteAction> writeActions;
	private ArrayList<ReadAction> readActions;

	public Channel(Parameter parameter, Type type) {
		this.parameter = parameter;
		this.type = type;
	}

	public Parameter getParameter() {
		return this.parameter;
	}

	public ArrayList<ReadAction> getReadActions() {
		if (this.readActions == null) {
			this.readActions = new ArrayList<>();
			for (State state : parameter.getStates()) {
				ReadAction action = new ReadAction(this, state);
				this.readActions.add(action);
			}
		}
		return this.readActions;
	}

	public ArrayList<EvaluatedWriteAction> getFullWriteActions() {
		if (this.fullWriteActions == null) {
			this.fullWriteActions = new ArrayList<>();
			for (Evaluation evaluation : parameter.getEval()) {
				EvaluatedWriteAction action = new EvaluatedWriteAction(this, evaluation);
				this.fullWriteActions.add(action);
			}
		}
		return this.fullWriteActions;
	}

	public ArrayList<WriteAction> getWriteActions() {
		if (this.writeActions == null) {
			this.writeActions = new ArrayList<>();
			for (State state : parameter.getStates()) {
				WriteAction action = new WriteAction(this, state);
				this.writeActions.add(action);
			}
		}
		return this.writeActions;
	}


	public ReadAction getReadActionByState(State state) {
		for (ReadAction action : this.getReadActions()) {
			if (action.getState().equals(state)) {
				return action;
			}
		}
		return null;
	}

	public Action getWriteActionByEvaluation(Evaluation evaluation) {
		for (Action action : this.getFullWriteActions()) {
			if (action instanceof EvaluatedWriteAction) {
				if (((EvaluatedWriteAction) action).getEvaluation().equals(evaluation)) {
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
