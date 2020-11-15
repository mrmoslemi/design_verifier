package verifier;

import model.*;
import utils.Pair;

import java.util.ArrayList;

public class Verifier {

	public static Result verify(Model model, Property property) {
		ArrayList<Component> remainingComponents = new ArrayList<>(model.getComponents());
		Property currentProperty = property;
		while (!remainingComponents.isEmpty()) {
			Component currentComponent = selectComponent(remainingComponents, currentProperty);
			ConjectureOracle conjectureOracle = new ConjectureOracle(currentComponent, currentProperty);
			AutomataLearner.init(currentComponent, currentProperty);
			do {
				Property conjecture = AutomataLearner.getConjecture();
				Pair<Boolean, String> result = conjectureOracle.processConjecture(conjecture);
				if (result.first) {
					remainingComponents.remove(currentComponent);
					currentProperty = conjecture;
					break;
				} else {
					AutomataLearner.addCounterExample(result.second, model);
				}
			} while (true);

			//TODO check <candidateAssumption> component <currentProperty>
//			if (true) {
//			} else {
//				//TODO extend
//			}
		}

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

	public static Component selectComponent(ArrayList<Component> components, Property property) {
		return components.get(0);
	}
}
