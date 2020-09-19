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
			Action.Type actionType = this.type == Type.in ? Action.Type.read : Action.Type.write;
			for (State state : parameter.getStates()) {
				Action action = new Action(this, state, actionType);
				actions.add(action);
			}
		}
		return this.actions;
	}

	public Action getAction(State state) {
		for (Action action : this.getActions()) {
			if (action.getState().equals(state)) {
				return action;
			}
		}
		return null;
	}

	@Override
	public String toString() {
		return this.parameter.getName() + "_" + (this.type == Type.in ? "cin" : "cout");
	}
}
