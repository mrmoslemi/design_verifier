package verifier;

import model.Model;
import modelTranslator.ModelTranslator;
import org.jetbrains.annotations.NotNull;

public class ModelChecker {
    @NotNull
    public static Result check(Model model, Property property) {
        ModelTranslator.translate(model);
        return null;
    }
}
