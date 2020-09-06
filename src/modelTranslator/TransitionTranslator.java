package modelTranslator;

import model.*;
import utils.Pair;

import java.util.ArrayList;
import java.util.HashMap;

public class TransitionTranslator {
    public static Pair<String, String> translate(Transition transition) {
        HashMap<Parameter, Guard> preConditions = transition.getPreConditions();
        HashMap<Parameter, Guard> postConditions = transition.getPostConditions();
        StringBuilder preConditionBuilder = new StringBuilder();
        Guard triggerGuard = null;
        Parameter triggerParameter = null;
        if (!preConditions.isEmpty()) {
            preConditionBuilder.append("(");
            ArrayList<String> parameterGuards = new ArrayList<>();
            for (Parameter parameter : preConditions.keySet()) {
                String parameterName = parameter.getName().toLowerCase();
                Guard guard = preConditions.get(parameter);
                if (guard.getState() != null) {
                    String stateName = parameterName + "_" + guard.getState().toLowerCase();
                    String stateGuard = parameterName + ".state == " + stateName;
                    parameterGuards.add(stateGuard);
                }
                if (guard.getValueRange() != null) {
                    String minGuard = parameterName + ".value >= " + guard.getValueRange().getMin();
                    String maxGuard = parameterName + ".value <= " + guard.getValueRange().getMax();
                    parameterGuards.add(minGuard);
                    parameterGuards.add(maxGuard);
                }
                if (guard.getValue() != null) {
                    String valueGuard = parameterName + ".value == " + guard.getValue();
                    parameterGuards.add(valueGuard);
                }
                if (guard.getMode() == Mode.T) {
                    triggerGuard = guard;
                    triggerParameter = parameter;
                }
            }
            for (String guard : parameterGuards) {
                preConditionBuilder.append("(");
                preConditionBuilder.append(guard);
                preConditionBuilder.append(") && ");
            }
            preConditionBuilder.delete(preConditionBuilder.length() - 4, preConditionBuilder.length());
            preConditionBuilder.append(")");
        } else {
            preConditionBuilder.append("true");
        }
        String preCondition = preConditionBuilder.toString();

        HashMap<Parameter, ArrayList<Guard>> expandedPostConditions = getExpandedPostConditions(postConditions);
        ArrayList<HashMap<Parameter, Guard>> assignmentsGuards = getAssignmentGuards(expandedPostConditions);
        ArrayList<String> assignments = getAssignments(assignmentsGuards);

        StringBuilder modelGenerator = new StringBuilder();
        String trigger = null;
        if (triggerGuard != null) {
            String parameterName = triggerParameter.getName().toLowerCase();
            String channelMame = parameterName + "_channel";
            String stateName = parameterName + "_" + triggerGuard.getState().toLowerCase();
            trigger = channelMame + "?" + stateName + ";";
        }

		modelGenerator.append("\\* ");
		modelGenerator.append(transition.getId());
		modelGenerator.append("*\\\n");
		modelGenerator.append(":: ");
        modelGenerator.append(preCondition);
        modelGenerator.append(" -> ");
        for (String assignment : assignments) {
            modelGenerator.append(assignment);
        }
        modelGenerator.append("\n");
        return new Pair<>(trigger, modelGenerator.toString());
    }

    private static HashMap<Parameter, ArrayList<Guard>> getExpandedPostConditions(HashMap<Parameter, Guard> postConditions) {
        HashMap<Parameter, ArrayList<Guard>> toReturn = new HashMap<>();
        for (Parameter parameter : postConditions.keySet()) {
            ArrayList<Guard> toPut = new ArrayList<>();
            Guard guard = postConditions.get(parameter);
            if (guard.getValueRange() == null) {
                toPut.add(guard);
            } else {
                Mode mode = guard.getMode();
                String state = guard.getState();
                ValueRange valueRange = guard.getValueRange();

                for (int i = valueRange.getMin(); i <= valueRange.getMax(); i++) {
                    Guard toAdd = new Guard(mode, state, i);
                    toPut.add(toAdd);
                }
            }
            toReturn.put(parameter, toPut);
        }
        return toReturn;
    }

    private static ArrayList<HashMap<Parameter, Guard>> getAssignmentGuards(HashMap<Parameter, ArrayList<Guard>> expandedPostConditions) {
        Parameter parameter = expandedPostConditions.keySet().iterator().next();
        ArrayList<Guard> guards = expandedPostConditions.get(parameter);
        if (expandedPostConditions.size() == 1) {
            ArrayList<HashMap<Parameter, Guard>> toReturn = new ArrayList<>();
            for (Guard guard : guards) {
                HashMap<Parameter, Guard> toAdd = new HashMap<>();
                toAdd.put(parameter, guard);
                toReturn.add(toAdd);
            }
            return toReturn;
        } else {
            expandedPostConditions.remove(parameter);
            ArrayList<HashMap<Parameter, Guard>> subset = getAssignmentGuards(expandedPostConditions);
            ArrayList<HashMap<Parameter, Guard>> toReturn = new ArrayList<>();
            for (Guard guard : guards) {
                for (HashMap<Parameter, Guard> toAdd : subset) {
                    toAdd.put(parameter, guard);
                    toReturn.add(toAdd);
                }
            }
            return toReturn;
        }
    }

    private static ArrayList<String> getAssignments(ArrayList<HashMap<Parameter, Guard>> assignmentsGuards) {
        ArrayList<String> toReturn = new ArrayList<>();
        for (HashMap<Parameter, Guard> assignmentGuards : assignmentsGuards) {
            StringBuilder toAdd = new StringBuilder();
            for (Parameter parameter : assignmentGuards.keySet()) {
                Guard guard = assignmentGuards.get(parameter);
                String parameterName = parameter.getName().toLowerCase();
                if (guard.getState() != null) {
                    String stateName = parameterName + "_" + guard.getState().toLowerCase();
                    String stateAssignment = parameterName + ".state = " + stateName + "; ";
                    toAdd.append(stateAssignment);
                }
                if (guard.getValue() != null) {
                    String valueAssignment = parameterName + ".value = " + guard.getValue() + "; ";
                    toAdd.append(valueAssignment);
                }
                if (guard.getMode() == Mode.T) {
                    String channelMame = parameterName + "_channel";
                    String stateName = parameterName + "_" + guard.getState().toLowerCase();
                    toAdd.append(channelMame);
                    toAdd.append("!");
                    toAdd.append(stateName);
                    toAdd.append("; ");
                }
            }
            toReturn.add(toAdd.toString());
        }
        return toReturn;
    }
}
