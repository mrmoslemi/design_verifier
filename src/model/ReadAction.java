package model;

public class ReadAction extends Action {

	private State state;

	public ReadAction(Channel channel, State state) {
		super(channel);
		this.state = state;
	}

	public State getState() {
		return this.state;
	}

	public String toString() {
		return String.format("%s?%s", this.getChannel(), this.state);
	}

	public String getAssignment() {
		return String.format("%s=%s", this.getChannel().getParameter().getName(), this.state);
	}

}
