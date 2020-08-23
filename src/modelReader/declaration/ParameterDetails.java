package modelReader.declaration;

import model.Evaluation;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;

public class ParameterDetails extends ParameterInformation {
    private Evaluation initial;
    private ArrayList<String> componentNames;
    private String owner;

    public ParameterDetails(@NotNull String name, @NotNull Evaluation initial, @NotNull ArrayList<String> componentNames) {
        super(name);
        this.initial = initial;
        this.componentNames = componentNames;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String  getOwner(){
        return this.owner;
    }
    public Evaluation getInitial() {
        return this.initial;
    }

    public ArrayList<String> getComponentNames() {
        return this.componentNames;
    }
}
