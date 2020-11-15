package model;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import utils.Log;

import java.util.ArrayList;

public class Transition {
	private String id;
	private ReadAction trigger;
	private ArrayList<Guard> guards;
	private ArrayList<Action> effects;

	public Transition(@NotNull String id, @Nullable ReadAction trigger, @NotNull ArrayList<Guard> guards, @NotNull ArrayList<Action> effects) {
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
				toReturn.append(guard).append(" && ");
			}
			toReturn.delete(toReturn.length() - 4, toReturn.length());
		}
		toReturn.append(") -> ");
		for (Action action : this.effects) {
			toReturn.append(action).append(" ");
		}
		return toReturn.toString();
	}

	public ReadAction getTrigger() {
		return this.trigger;
	}

	public String getId() {
		return this.id;
	}

	public ArrayList<Guard> getGuards() {
		return this.guards;
	}

}
