package terminalInterface;

import utils.Log;
import modelTranslator.ModelTranslator;

import java.io.FileWriter;
import java.io.PrintWriter;

public class TranslateCommand extends ReadCommand {
    @Override
    public int run() {
        int superCallStatus = super.run();
        if (superCallStatus == 0) {
            String promelaFileLocation = this.getOption(Option.OUTPUT);
            Log.info("Generating PROMELA model");
            try {
                String promelaModel = ModelTranslator.translate(this.getModel());
                FileWriter fileWriter;
                fileWriter = new FileWriter(promelaFileLocation);
                PrintWriter printWriter = new PrintWriter(fileWriter);
                printWriter.print(promelaModel);
                printWriter.close();
                Log.success("Generating PROMELA model to " + promelaFileLocation + " completed successfully!");
                return 0;
            } catch (Exception e) {
                Log.error("Generating PROMELA model wasn't successful, this error happened:");
                e.printStackTrace();
                return 1;
            }

        } else {
            return superCallStatus;
        }
    }
}
