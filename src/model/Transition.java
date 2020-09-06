package model;

import org.jetbrains.annotations.NotNull;

import java.util.HashMap;

public class Transition {
    public enum Type {
        SYNC,
        STABILIZE,
        SILENT,
        ASYNC,
    }

    private String id;
    private Type type;
    private HashMap<Parameter, Guard> preConditions;
    private HashMap<Parameter, Guard> postConditions;

    public Transition(@NotNull String id, @NotNull HashMap<Parameter, Guard> preConditions, @NotNull HashMap<Parameter, Guard> postConditions) {
        this.preConditions = preConditions;
        this.postConditions = postConditions;
        this.determineType();
        this.id = id;
    }

    private void determineType() {
        boolean triggerInPre = false, triggerInPost = false;
        for (Guard guard : preConditions.values()) {
            Mode mode = guard.getMode();
            if (mode == Mode.T) {
                triggerInPre = true;
                break;
            }
        }
        for (Guard guard : postConditions.values()) {
            Mode mode = guard.getMode();
            if (mode == Mode.T) {
                triggerInPost = true;
                break;
            }
        }
        if (triggerInPre && triggerInPost) {
            this.type = Type.SYNC;
        }
        if (triggerInPre && !triggerInPost) {
            this.type = Type.STABILIZE;
        }
        if (!triggerInPre && !triggerInPost) {
            this.type = Type.SILENT;
        }
        if (!triggerInPre && triggerInPost) {
            this.type = Type.ASYNC;
        }
    }

    @Override
    public String toString() {
        StringBuilder toReturn = new StringBuilder("[");
        for (Parameter parameter : this.preConditions.keySet()) {
            toReturn.append(parameter.getName()).append(":").append("(").append(this.preConditions.get(parameter).toString()).append("), ");
        }
        toReturn.delete(toReturn.length() - 2, toReturn.length());
        toReturn.append("] --> [");
        for (Parameter parameter : this.postConditions.keySet()) {
            toReturn.append(parameter.getName()).append(":").append("(").append(this.postConditions.get(parameter).toString()).append("), ");
        }
        toReturn.delete(toReturn.length() - 2, toReturn.length());
        toReturn.append("]");
        return toReturn.toString();
    }

    public HashMap<Parameter, Guard> getPreConditions() {
        return this.preConditions;
    }

    public HashMap<Parameter, Guard> getPostConditions() {
        return this.postConditions;
    }

    public String getId(){
    	return this.id;
	}
    @NotNull
    public Type getType() {
        return this.type;
    }

}
