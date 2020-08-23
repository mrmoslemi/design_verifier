package terminalInterface;

public class InvalidCommand extends Command {

    @Override
    public int run() {
        System.out.println("-----INVALID COMMAND-----");
        System.out.println("To see the help page:");
        System.out.println("\t --help OR -h");
        return 1;
    }
}
