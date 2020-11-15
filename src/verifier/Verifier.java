package verifier;

import model.Component;
import model.Model;
import utils.Log;

import java.util.ArrayList;

public class Verifier {

	public static Result verify(Model model, Property property, String strategy) {
		long startTime = System.currentTimeMillis();
		int totalConjectures = 0;
		int totalMemberships = 0;
		Log.info("Running With strategy:\t" + strategy);
		ArrayList<Component> remainingComponents = new ArrayList<>(model.getComponents());
		Property currentProperty = property;
		while (!remainingComponents.isEmpty()) {
			Component currentComponent = selectComponent(remainingComponents, currentProperty, strategy);
			Log.info("Component Selected\t" + currentComponent.getName());

			AssumptionLearner assumptionLearner = new AssumptionLearner(currentComponent, currentProperty);
			Property assumption = assumptionLearner.getAssumption();
			totalConjectures += assumptionLearner.getTotalConjectures();
			totalMemberships += assumptionLearner.getTotalMemberships();
			if (assumption != null) {
				remainingComponents.remove(currentComponent);
				currentProperty = assumption;
				Log.success("New Assumption by\t" + currentComponent.getName());
			} else {
				Log.success("Violated by\t" + currentComponent.getName());
				long time = System.currentTimeMillis() - startTime;
				return new Result(totalMemberships, totalConjectures, time, assumptionLearner.getViolation());
			}
		}
		long time = System.currentTimeMillis() - startTime;
		return new Result(totalMemberships, totalConjectures, time);

	}

	public static Component selectComponent(ArrayList<Component> components, Property property, String strategy) {
		Component selectedComponent = components.get(0);
		if (strategy.equals("max")) {
			int maxFriendliness = AssumptionLearner.calculateFriendliness(selectedComponent, property);
			for (Component component : components) {
				int friendliness = AssumptionLearner.calculateFriendliness(component, property);
				if (friendliness > maxFriendliness) {
					selectedComponent = component;
					maxFriendliness = friendliness;
				}
			}
		} else {
			int minFriendliness = AssumptionLearner.calculateFriendliness(selectedComponent, property);
			for (Component component : components) {
				int friendliness = AssumptionLearner.calculateFriendliness(component, property);
				if (friendliness < minFriendliness) {
					selectedComponent = component;
					minFriendliness = friendliness;
				}
			}
		}
		return selectedComponent;

	}
}
