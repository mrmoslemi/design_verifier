package verifier;

import model.Component;
import model.Model;
import utils.Log;

import java.util.ArrayList;
import java.util.List;

public class Verifier {
	private Model model;
	private String strategy;
	private Property property;

	public Verifier(Model model, Property property, String strategy) {
		this.model = model;
		this.property = property;
		this.strategy = strategy;
	}

	public Result verify() {
		long startTime = System.currentTimeMillis();
		int totalConjectures = 0;
		int totalMemberships = 0;
		Log.info("Running With strategy:\t" + strategy);
		ArrayList<Component> remainingComponents = new ArrayList<>(model.getComponents());
		Property currentProperty = property;
		while (!remainingComponents.isEmpty()) {
			Component currentComponent = selectComponent(remainingComponents, currentProperty, this.strategy);
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
				return new Result(property.getName(), this.strategy, totalMemberships, totalConjectures, time, assumptionLearner.getViolation());
			}
		}
		long time = System.currentTimeMillis() - startTime;
		return new Result(property.getName(), this.strategy, totalMemberships, totalConjectures, time);

	}

	public static Component selectComponent(ArrayList<Component> components, Property property, String strategy) {
		Component selectedComponent = components.get(0);
		switch (strategy) {
			case "friendliness":
				int maxFriendliness = AssumptionLearner.calculateFriendliness(selectedComponent, property);
				for (Component component : components) {
					int friendliness = AssumptionLearner.calculateFriendliness(component, property);
					if (friendliness > maxFriendliness) {
						selectedComponent = component;
						maxFriendliness = friendliness;
					}
				}
				break;
			case "hostility":
				int hostility = AssumptionLearner.calculateFriendliness(selectedComponent, property);
				for (Component component : components) {
					int friendliness = AssumptionLearner.calculateFriendliness(component, property);
					if (friendliness < hostility) {
						selectedComponent = component;
						hostility = friendliness;
					}
				}
				break;
			case "interface":
				int minInterfaceSize = AssumptionLearner.getLearningAlphabet(selectedComponent, property).size();
				for (Component component : components) {
					int interfaceSize = AssumptionLearner.getLearningAlphabet(component, property).size();
					if (interfaceSize < minInterfaceSize) {
						selectedComponent = component;
						minInterfaceSize = interfaceSize;
					}
				}
				break;
			case "hybrid":
				List<Component> friendlyComponents = new ArrayList<>();
				for (Component component : components) {
					int friendliness = AssumptionLearner.calculateFriendliness(component, property);
					if (0 < friendliness) {
						friendlyComponents.add(component);
					}
				}
				if (!friendlyComponents.isEmpty()) {
					selectedComponent = friendlyComponents.get(0);
					int minFriendlyInterfaceSize = AssumptionLearner.getLearningAlphabet(friendlyComponents.get(0), property).size();
					for (Component component : friendlyComponents) {
						int interfaceSize = AssumptionLearner.getLearningAlphabet(component, property).size();
						if (interfaceSize < minFriendlyInterfaceSize) {
							selectedComponent = component;
							minFriendlyInterfaceSize = interfaceSize;
						}
					}
				}
				break;
		}
		return selectedComponent;

	}
}
