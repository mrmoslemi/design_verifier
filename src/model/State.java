package model;

public class State {
	private Parameter parameter;
	private String name;

	public State(Parameter parameter, String name) {
		this.parameter = parameter;
		this.name = name;
	}

	public String getName() {
		return this.name;
	}

	public String toString() {
		return this.parameter.getName() + "_" + this.name;
	}
}
