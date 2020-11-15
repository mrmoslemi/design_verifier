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

	private Result(boolean status, int totalMemberships, int totalConjectures, long time, Word<Action> counterExample) {
		this.time = time;
		this.totalMemberships = totalMemberships;
		this.totalConjectures = totalConjectures;
		this.status = status;
		this.counterExample = counterExample;
	}

	public Result(int totalMemberships, int totalConjectures, long time) {
		this(true, totalMemberships, totalConjectures, time, null);
	}

	public Result(int totalMemberships, int totalConjectures, long time, Word<Action> counterExample) {
		this(false, totalMemberships, totalConjectures, time, counterExample);
	}

	@NotNull
	public Boolean getStatus() {
		return this.status;
	}


	public String toString() {
		String toReturn = "Total time(ms):\t" + time + "\n";
		toReturn += "Memberships:\t" + totalMemberships + "\n";
		toReturn += "Conjectures:\t" + totalConjectures + "\n";
		if (this.status) {
			toReturn += "Status:\tvrified\n";
		} else {
			toReturn += "Status:\tviolated\n";
			toReturn += "CounterExample:\t" + counterExample;
		}
		return toReturn;
	}

}
