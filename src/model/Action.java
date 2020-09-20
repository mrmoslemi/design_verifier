package model;

public class Action {


	public enum Type {read, write}

	private Evaluation evaluation;
	private Type type;
	private Channel channel;


	public Action(Channel channel, Evaluation evaluation, Type type) {
		this.evaluation = evaluation;
		this.type = type;
		this.channel = channel;
	}


	public Channel getChannel() {
		return this.channel;
	}

	public Type getType() {
		return this.type;
	}

	public Evaluation getEvaluation() {
		return this.evaluation;
	}

	public String toString() {
		String toReturn = "";
		if (type == Type.read) {
			toReturn += this.channel + "?" + this.evaluation.getState() + ";";
			if (this.evaluation.getState() != null) {
				toReturn += this.channel.getParameter().getName() + " = " + this.evaluation.getState() + ";";
			}
			if (this.evaluation.getValue() != null) {
				toReturn += this.channel.getParameter().getName() + "_value = " + this.evaluation.getValue() + ";";
			}
		} else {
			if (this.evaluation.getValue() != null) {
				toReturn += this.channel.getParameter().getName() + "_value = " + this.evaluation.getValue() + ";";
			}
			toReturn += this.channel + "!" + this.evaluation.getState() + ";";

		}
		return toReturn;
	}

}
