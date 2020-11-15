package model;

import java.util.ArrayList;

public class Component {
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

	public ArrayList<Channel> getAllChannels() {
		ArrayList<Channel> channels = new ArrayList<>(this.getAllInputChannels());
		channels.addAll(this.getOutputChannels());
		return channels;
	}

	public ArrayList<Channel> getAllInputChannels() {
		ArrayList<Channel> toReturn = new ArrayList<>();
		for (Parameter parameter : this.parameters) {
			toReturn.add(parameter.getInputChannel());
		}
		return toReturn;
	}
	public ArrayList<Channel> getFeedbackChannels() {
		ArrayList<Channel> toReturn = new ArrayList<>();
		for (Parameter parameter : this.outputParameters) {
			toReturn.add(parameter.getInputChannel());
		}
		return toReturn;
	}

	public ArrayList<Channel> getReadonlyChannels() {
		ArrayList<Channel> toReturn = new ArrayList<>();
		for (Parameter parameter : this.inputParameters) {
			toReturn.add(parameter.getInputChannel());
		}
		return toReturn;
	}

	public ArrayList<Channel> getOutputChannels() {
		ArrayList<Channel> toReturn = new ArrayList<>();
		for (Parameter parameter : this.outputParameters) {
			toReturn.add(parameter.getOutputChannel());
		}
		return toReturn;
	}

	public ArrayList<ReadAction> getAllReadActions() {
		ArrayList<ReadAction> actions = new ArrayList<>();
		for (Channel channel : this.getAllInputChannels()) {
			actions.addAll(channel.getReadActions());
		}
		return actions;
	}
	public ArrayList<Action> getReadOnlyAlphabet() {
		ArrayList<Action> actions = new ArrayList<>();
		for (Channel channel : this.getReadonlyChannels()) {
			actions.addAll(channel.getWriteActions());
		}
		return actions;
	}
	public ArrayList<WriteAction> getEnvironmentActions() {
		ArrayList<WriteAction> actions = new ArrayList<>();
		for (Channel channel : this.getReadonlyChannels()) {
			actions.addAll(channel.getWriteActions());
		}
		return actions;
	}


	public ArrayList<Action> getFeedbackActions() {
		ArrayList<Action> actions = new ArrayList<>();
		for (Channel channel : this.getFeedbackChannels()) {
			actions.addAll(channel.getWriteActions());
		}
		return actions;
	}

	public ArrayList<Action> getOutputAlphabet() {
		ArrayList<Action> actions = new ArrayList<>();
		for (Channel channel : this.getOutputChannels()) {
			actions.addAll(channel.getReadActions());
		}
		return actions;
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
