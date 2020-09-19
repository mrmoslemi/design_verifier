package model;

public class Action {


	public enum Type {read, write}

	private State state;
	private Type type;
	private Channel channel;


	public Action(Channel channel, State state, Type type) {
		this.state = state;
		this.type = type;
		this.channel = channel;
	}


	public Channel getChannel() {
		return this.channel;
	}

	public Type getType() {
		return this.type;
	}

	public State getState() {
		return this.state;
	}

	public String toString() {
		return this.channel + (type == Type.read ? "?" : "!") + this.state;
	}

}
