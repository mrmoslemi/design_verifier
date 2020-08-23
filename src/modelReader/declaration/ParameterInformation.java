package modelReader.declaration;

import org.jetbrains.annotations.NotNull;

public abstract class ParameterInformation {
    private String name;

    ParameterInformation(@NotNull String name) {
        this.name = name;
    }

    @NotNull
    public String getName() {
        return this.name;
    }
}
