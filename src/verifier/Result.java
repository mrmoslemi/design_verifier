package verifier;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

public class Result {


    private Status status;
    private Trace trace;

    @NotNull
    public Status getStatus() {
        return this.status;
    }

    @Nullable
    public Trace getTrace() {
        return this.trace;
    }

}
