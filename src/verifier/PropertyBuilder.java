package verifier;

public class PropertyBuilder {

    public static Property buildTrue() {
        return new Property(Property.Type.TRUE, null, null, null);
    }

    public static Property buildAnd(Property operand1, Property operand2) {
        return new Property(Property.Type.AND, operand1, operand2, null);
    }

    public static Property buildNot(Property operand) {
        return new Property(Property.Type.NOT, operand, null, null);
    }
}
