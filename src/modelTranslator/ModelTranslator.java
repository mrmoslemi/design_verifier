package modelTranslator;

import model.Component;
import model.Model;
import model.Parameter;

import java.util.Collection;

public class ModelTranslator {
    public static String translate(Model model) {
        return "mtype:Mode = {\n\tS, T\n};\n\n" +
                translateParameters(model.getAllParameters()) +
                translateComponents(model.getComponents());
    }


    private static String translateParameters(Collection<Parameter> parameters) {
        StringBuilder modelBuilder = new StringBuilder();
        for (Parameter parameter : parameters) {
//            modelBuilder.append(ParameterTranslator.translate(parameter));
        }
        return modelBuilder.toString();
    }

    private static String translateComponents(Collection<Component> components) {
        StringBuilder modelBuilder = new StringBuilder();
        for (Component component : components) {
            modelBuilder.append(ComponentTranslator.translate(component));
        }
        return modelBuilder.toString();
    }

}
