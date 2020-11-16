package verifier;

import model.Action;
import net.automatalib.words.Word;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

public class Result {
	private boolean status;
	private Word<Action> counterExample;
	private long time;
	private int totalMemberships;
	private int totalConjectures;
	private String strategy;
	private String propertyName;

	private Result(String propertyName, String strategy, boolean status, int totalMemberships, int totalConjectures, long time, Word<Action> counterExample) {
		this.propertyName = propertyName;
		this.strategy = strategy;
		this.time = time;
		this.totalMemberships = totalMemberships;
		this.totalConjectures = totalConjectures;
		this.status = status;
		this.counterExample = counterExample;
	}

	public Result(String propertyName, String strategy, int totalMemberships, int totalConjectures, long time) {
		this(propertyName, strategy, true, totalMemberships, totalConjectures, time, null);
	}

	public Result(String propertyName, String strategy, int totalMemberships, int totalConjectures, long time, Word<Action> counterExample) {
		this(propertyName, strategy, false, totalMemberships, totalConjectures, time, counterExample);
	}

	@NotNull
	public Boolean getStatus() {
		return this.status;
	}


	public String toString() {
		String toReturn = "Property:\t\t" + propertyName + "\n";
		toReturn += "Total time(ms):\t" + (int) (time / 1000) + "\n";

		toReturn += "Component Selection:\t" + strategy + "\n";
		toReturn += "Membership Queries:\t" + totalMemberships + "\n";
		toReturn += "Total Conjectures:\t" + totalConjectures + "\n";
		if (this.status) {
			toReturn += "Status:\tvrified\n";
		} else {
			toReturn += "Status:\tviolated\n";
			toReturn += "CounterExample:\t" + counterExample;
		}
		toReturn += "--------------------------------------------------------------------------------------------";
		return toReturn;
	}

}
