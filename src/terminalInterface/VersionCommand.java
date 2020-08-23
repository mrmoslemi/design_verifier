package terminalInterface;

public class VersionCommand extends Command {

    @Override
    public int run() {
        System.out.println("Version: 1.0.0");
        return 0;
    }
}
