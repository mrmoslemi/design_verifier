package terminalInterface;

import model.Model;
import utils.Log;
import modelReader.ModelReader;

public class ReadCommand extends Command {
    private Model model;

    @Override
    public int run() {
        String inputFileAddress = this.getOption(Option.INPUT);
        Log.info("Reading model from:\t" + inputFileAddress);
        try {
            ModelReader modelReader = new ModelReader(inputFileAddress);
            this.model = modelReader.getModel();
            Log.success("Reading model from " + inputFileAddress + " completed successfully!");
            return 0;
        } catch (Exception e) {
            Log.error("Reading model from " + inputFileAddress + " wasn't successful, this error happened:");
            e.printStackTrace();
            return 1;
        }
    }

    protected Model getModel() {
        return this.model;
    }
}
