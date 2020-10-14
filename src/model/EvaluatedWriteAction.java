package model;

public class EvaluatedWriteAction extends Action {
	private Evaluation evaluation;

	public EvaluatedWriteAction(Channel channel, Evaluation evaluation) {
		super(channel);
		this.evaluation = evaluation;
	}


	public Evaluation getEvaluation() {
		return this.evaluation;
	}

	public String toString() {
		String toReturn = "";
		if (this.evaluation.getValue() != null) {
			toReturn += this.getChannel().getParameter().getName() + "_value = " + this.evaluation.getValue() + ";";
		}
		if (this.getEvaluation().getState() != null) {
			toReturn += this.getChannel() + "!" + this.evaluation.getState() + ";";
		}
		return toReturn;
	}
}
