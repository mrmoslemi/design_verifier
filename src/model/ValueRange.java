package model;

import org.jetbrains.annotations.NotNull;
import utils.IntegerParser;

public class ValueRange {
    private int min;
    private int max;

    public ValueRange(@NotNull String stringValue) {
        String minAndMax = stringValue.substring(2);
        String[] parts = minAndMax.split("-");
        this.min = IntegerParser.parseInt(parts[0]);
        this.max = IntegerParser.parseInt(parts[1]);
    }

    public int getMax(){
        return this.max;
    }
    public int getMin(){
        return this.min;
    }
    @Override
    public String toString() {
        return "[" + min + ".." + max + "]";
    }

    @Override
    public boolean equals(Object o) {
        if (o instanceof ValueRange) {
            ValueRange otherValueRange = (ValueRange) o;
            return (this.min == otherValueRange.min) && (this.max == otherValueRange.max);
        } else {
            return false;
        }
    }
}
