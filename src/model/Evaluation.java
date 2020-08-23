package model;


import org.jetbrains.annotations.Nullable;
import utils.Error;
import utils.ErrorType;


public class Evaluation {
    private Mode mode;
    private String state;
    private Integer value;

    public Evaluation(@Nullable Mode mode, @Nullable String state, @Nullable Integer value) {
        if ((mode == null && state != null) || (mode != null && state == null)) {
            throw Error.combine(ErrorType.EVALUATION_MODE_STATE_ERROR, mode + "", state + "");
        }
        if (mode == null && value == null) {
            throw Error.combine(ErrorType.EVALUATION_ALL_NULL_ERROR);

        }
        this.mode = mode;
        this.state = state;
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
    public Integer getValue() {
        return this.value;
    }

    @Override
    public String toString() {
        String toReturn = "";
        if (this.mode != null) {
            toReturn += this.mode + "_" + this.state;

        }
        if (this.mode != null && this.value != null) {
            toReturn += ", ";
        }
        if (this.value != null) {
            toReturn += "V_" + this.value;
        }
        return toReturn;
    }

    @Override
    public boolean equals(Object o) {
        if (o instanceof Evaluation) {
            Evaluation otherEvaluation = (Evaluation) o;
            boolean equal = true;
            if (this.mode != null) {
                equal = this.mode.equals(otherEvaluation.mode);
            }
            if (this.state != null) {
                equal = this.state.equals(otherEvaluation.state) && equal;
            }
            if (this.value != null) {
                equal = this.value.equals(otherEvaluation.value) && equal;
            }
            return equal;
        } else {
            return false;
        }
    }


}
