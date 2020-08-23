package terminalInterface;

public class HelpCommand extends Command {

    @Override
    public int run() {
        System.out.println("-----Help-----");
        System.out.println("To see the help page:");
        System.out.println("\t --help OR -h");
        System.out.println("To see the version:");
        System.out.println("\t --version OR -v");
        System.out.println("To read and check the syntax of a project:");
        System.out.println("\t read <path to input folder>");
        System.out.println("To translate a project to PROMELA models:");
        System.out.println("\t translate <path to input folder> <path to output PROMELA model>");
        System.out.println("To read and translate a project to PROMELA models:");
        System.out.println("\t verify <path to input folder> <path to properties folder> <path to output PROMELA model>");
        return 0;
    }
}
