package model;

public abstract class Action {
	private Channel channel;

	public Action(Channel channel) {
		this.channel = channel;
	}


	public Channel getChannel() {
		return this.channel;
	}

}
