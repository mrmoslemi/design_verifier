package modelReader.declaration;

import model.State;
import org.jetbrains.annotations.NotNull;

public class ParameterState extends ParameterInformation {
    private String state;

    public ParameterState(@NotNull String name, @NotNull String state) {
        super(name);
        this.state = state;
    }

    @NotNull
    public String getState() {
        return this.state;
    }
}
