package model;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;

public class Transition {
	private String id;
	private Action trigger;
	private ArrayList<Guard> guards;
	private ArrayList<Action> effects;

	public Transition(@NotNull String id, @Nullable Action trigger, @NotNull ArrayList<Guard> guards, @NotNull ArrayList<Action> effects) {
		this.id = id;
		this.trigger = trigger;
		this.guards = guards;
		this.effects = effects;
	}

	@Override
	public String toString() {

		StringBuilder toReturn = new StringBuilder("(");
		if (this.guards.isEmpty()) {
			toReturn.append("true");
		} else {
			for (Guard guard : this.guards) {
				toReturn.append(guard).append(" && \n\t\t");
			}
			toReturn.delete(toReturn.length() - 7, toReturn.length());
		}
		toReturn.append(")\n\t\t->\n");
		for (Action action : this.effects) {
			toReturn.append("\t\t").append(action).append("\n");
		}
		return toReturn.toString();
	}

	public Action getTrigger() {
		return this.trigger;
	}

	public String getId() {
		return this.id;
	}

	public ArrayList<Guard> getGuards() {
		return this.guards;
	}

}
