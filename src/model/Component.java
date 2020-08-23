package model;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;

public class Component implements TransitionContainer {
	private String name;
	private ArrayList<Parameter> parameters;
	private ArrayList<Parameter> outputParameters;
	private ArrayList<Parameter> inputParameters;
	private ArrayList<Transition> transitions;

	public Component(String name) {
		this.name = name;
		this.parameters = new ArrayList<>();
		this.outputParameters = new ArrayList<>();
		this.inputParameters = new ArrayList<>();
		this.transitions = new ArrayList<>();
	}

	public String getName() {
		return this.name;
	}


	public void addParameter(Parameter parameter) {
		this.parameters.add(parameter);
	}

	public void addOutputParameter(Parameter parameter) {
		this.outputParameters.add(parameter);
	}

	public void addInputParameter(Parameter parameter) {
		this.inputParameters.add(parameter);
	}

	public void addTransition(Transition transition) {
		transitions.add(transition);
	}

	@Nullable
	public Parameter getParameterByName(@NotNull String parameterName) {
		for (Parameter parameter : this.parameters) {
			if (parameter.getName().equals(parameterName)) {
				return parameter;
			}
		}
		return null;
	}

	public ArrayList<Parameter> getParameters() {
		return this.parameters;
	}

	public ArrayList<Parameter> getOutputParameters() {
		return this.outputParameters;
	}

	public ArrayList<Parameter> getInputParameters() {
		return this.inputParameters;
	}

	public ArrayList<Transition> getTransitions() {
		return this.transitions;
	}

	@Override
	public String toString() {
		StringBuilder toReturn = new StringBuilder("Component:\t" + this.name + "\n");

		toReturn.append("\tParameters: [");
		for (Parameter parameter : this.parameters) {
			toReturn.append(parameter.getName()).append(", ");
		}
		toReturn.delete(toReturn.length() - 2, toReturn.length());
		toReturn.append("]\n");
		toReturn.append("\tTransitions: [");
		for (Transition transition : this.transitions) {
			toReturn.append(transition.toString()).append(", ");
		}
		toReturn.delete(toReturn.length() - 2, toReturn.length());
		toReturn.append("]\n");
		return toReturn.toString();
	}
}
