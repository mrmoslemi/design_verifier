package verifier;

import model.Component;
import model.Model;
import org.jetbrains.annotations.NotNull;
import utils.Pair;

public class Compositor {
    @NotNull
    public static Pair<Model, Model> compose(Model model, Property property) {
        Model firstPart = new Model();
        Model secondPart = new Model();
        for (int i = 0; i < model.getComponents().size(); i++) {
            Component component = model.getComponents().get(i);
            if (i == 0) {
                firstPart.addComponent(component);
            }
            if (i > 0) {
                secondPart.addComponent(component);
            }
        }
        return new Pair<>(firstPart, secondPart);
    }
}
