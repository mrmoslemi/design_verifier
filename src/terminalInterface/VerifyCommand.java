package terminalInterface;

import verifier.Verifier;

public class VerifyCommand extends ReadCommand {
    @Override
    public int run() {
        int superCallStatus = super.run();
        if (superCallStatus == 0) {
            Verifier.verify(this.getModel(), null);
            return 1;
        } else {
            return superCallStatus;
        }
    }
}
