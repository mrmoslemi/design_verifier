package model;


import org.jetbrains.annotations.Nullable;
import utils.*;
import utils.Error;


public class Guard {
    private String stringValue;
    private Mode mode;
    private String state;
    private ValueRange valueRange;
    private Integer value;

    public Guard(String stringValue) {
        this.stringValue = stringValue;
        String[] parts = stringValue.split(", ");
        for (String part : parts) {
            if (RegexChecker.isMember(part)) {
                this.mode = StringUtils.getMode(part.substring(0, 1));
                this.state = part.substring(2);
            } else if (RegexChecker.isValue(part)) {
                this.value = IntegerParser.parseInt(part.substring(2));
            } else if (RegexChecker.isRange(part)) {
                this.valueRange = new ValueRange(part);
            }
        }
    }

    public Guard(@Nullable Mode mode, @Nullable String state, @Nullable Integer value) {
        this(mode, state, null, value);
    }

    private Guard(@Nullable Mode mode, @Nullable String state, @Nullable ValueRange valueRange, @Nullable Integer value) {
        if ((mode == null && state != null) || (mode != null && state == null)) {
            throw Error.combine(ErrorType.EVALUATION_MODE_STATE_ERROR, mode + "", state + "");
        }
        if (mode == null && valueRange == null && value == null) {
            throw Error.combine(ErrorType.EVALUATION_ALL_NULL_ERROR);
        }
        this.mode = mode;
        this.state = state;
        this.valueRange = valueRange;
        this.value = value;
    }

    @Nullable
    public Mode getMode() {
        return this.mode;
    }

    @Nullable
    public String getState() {
        return this.state;
    }

    @Nullable
    public ValueRange getValueRange() {
        return this.valueRange;
    }

    @Nullable
    public Integer getValue() {
        return this.value;
    }

    @Override
    public String toString() {
        return this.stringValue;
    }

    @Override
    public boolean equals(Object o) {
        if (o instanceof Guard) {
            Guard otherEvaluation = (Guard) o;
            boolean equal = true;
            if (this.mode != null) {
                equal = this.mode.equals(otherEvaluation.mode);
            }
            if (this.state != null) {
                equal = this.state.equals(otherEvaluation.state) && equal;
            }
            if (this.valueRange != null) {
                equal = this.valueRange.equals(otherEvaluation.valueRange) && equal;
            }
            return equal;
        } else {
            return false;
        }
    }


}
