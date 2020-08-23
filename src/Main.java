import terminalInterface.Command;

public class Main {

	public static void main(String[] args) {
		Command command = Command.getCommand(args);
		int status = command.run();
		System.exit(status);
	}
}
