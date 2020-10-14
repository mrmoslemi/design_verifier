package model;

public class WriteAction extends Action {
	private State state;

	public WriteAction(Channel channel, State state) {
		super(channel);
		this.state = state;
	}


	public State getState() {
		return this.state;
	}

	public String toString() {
		return this.getChannel() + "!" + this.getState();
	}
}
