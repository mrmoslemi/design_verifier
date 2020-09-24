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
		return String.format(
				"%s?%s;%s=%s;\n",
				this.getChannel(), this.state,
				this.getChannel().getParameter().getName(), this.state
		);
	}

}
