package verifier;

import model.Guard;

public class Property {
    public enum Type {
        ALWAYS, EVENTUALLY, UNTIL, NOT, AND, OR, IMPLIES, EQUIVALENT,
        TRUE, FALSE, GUARD,
    }

    private Type type;
    private Property firstOperand;
    private Property secondOperand;
    private Guard guard;

    public Property(Type type, Property firstOperand, Property secondOperand, Guard guard) {
        this.type = type;
        this.firstOperand = firstOperand;
        this.secondOperand = secondOperand;
        this.guard = guard;
    }
}
