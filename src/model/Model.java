package model;

import java.util.ArrayList;

public class Model {
    private ArrayList<Component> components;

    public Model() {
        this.components = new ArrayList<>();
    }

    public ArrayList<Component> getComponents() {
        return this.components;
    }

    public void addComponent(Component component) {
        this.components.add(component);
    }

    public Component getComponentByName(String name) {
        for (Component component : this.components) {
            if (component.getName().equals(name)) {
                return component;
            }
        }
        return null;
    }


    public Parameter getParameterByName(String name) {
        ArrayList<Parameter> allParameters = this.getAllParameters();
        for (Parameter parameter : allParameters) {
            if (parameter.getName().equals(name)) {
                return parameter;
            }
        }
        return null;
    }

    public ArrayList<Parameter> getAllParameters() {
        ArrayList<Parameter> allParameters = new ArrayList<>();
        for (Component component : this.components) {
            for (Parameter parameter : component.getParameters()) {
                if (!allParameters.contains(parameter)) {
                    allParameters.add(parameter);
                }
            }
        }
        return allParameters;
    }

    @Override
    public String toString() {
        StringBuilder toReturn = new StringBuilder();
        for (Parameter parameter : this.getAllParameters()) {
            toReturn.append(parameter.toString());
        }
        for (Component component : this.components) {
            toReturn.append(component.toString());
        }
        return toReturn.toString();
    }

}
