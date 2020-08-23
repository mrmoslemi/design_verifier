package model;

import java.util.ArrayList;

public interface TransitionContainer {
    void addTransition(Transition transition);

    ArrayList<Parameter> getParameters();
}
