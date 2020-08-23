package verifier;

import model.Component;
import model.Model;
import modelTranslator.ComponentTranslator;

public class Verifier {

    public static Result verify(Model model, Property property) {
        Component component = model.getComponentByName("CONTROLLER");
        System.out.println(ComponentTranslator.translate(component));
        AutomataLearner.init(component);
        return null;
//        if (model.getComponents().isEmpty()) {
//            return ModelChecker.check(null, property);
//        }
//
//        Pair<Model, Model> composed = Compositor.compose(model, property);
//        Model toVerifyModel = composed.first;
//        Model restOfModel = composed.second;
//
//        AutomataLearner automataLearner = new AutomataLearner();
//
//        while (true) {
//            Automata badTracesAutomata = automataLearner.getAutomata();
//
//            Property badTraces = AutomataToProperty.convert(badTracesAutomata);
//            Property assume = PropertyBuilder.buildNot(badTraces);
//            Property toCheck = PropertyBuilder.buildAnd(property, assume);
//
//            Result result = ModelChecker.check(toVerifyModel, toCheck);
//            switch (result.getStatus()) {
//                case Timeout:
//                    return result;
//                case Verified:
//                    return Verifier.verify(restOfModel, assume);
//                case Failed:
//                    automataLearner.learn(result.getTrace());
//                    break;
//            }
//        }

    }
}