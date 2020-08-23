package modelReader.declaration;

import model.ValueRange;
import org.jetbrains.annotations.NotNull;

public class ParameterRange extends ParameterInformation {
    private ValueRange valueRange;

    public ParameterRange(@NotNull String name, @NotNull ValueRange valueRange) {
        super(name);
        this.valueRange = valueRange;
    }

    @NotNull
    public ValueRange getValueRange() {
        return this.valueRange;
    }
}
