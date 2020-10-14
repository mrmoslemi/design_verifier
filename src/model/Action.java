package model;

import net.automatalib.commons.util.nid.MutableNumericID;

public abstract class Action implements MutableNumericID {
	private Channel channel;
	private int id;

	public Action(Channel channel) {
		this.channel = channel;
	}


	public Channel getChannel() {
		return this.channel;
	}

	@Override
	public void setId(int id) {
		this.id = id;
	}

	@Override
	public int getId() {
		return id;
	}
}
