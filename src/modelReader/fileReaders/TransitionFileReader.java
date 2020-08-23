package modelReader.fileReaders;

import model.Guard;
import model.Parameter;
import model.Transition;
import model.TransitionContainer;
import utils.Error;
import utils.ErrorType;
import utils.RegexChecker;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

public class TransitionFileReader {


    public static void read(File transitionsFile, TransitionContainer transitionContainer) {
        SheetReader sheetReader = new SheetReader(transitionsFile.getAbsolutePath());
        ArrayList<Parameter> parameters = transitionContainer.getParameters();
        HashMap<Parameter, Integer> guardColumns = new HashMap<>();
        HashMap<Parameter, Integer> effectColumns = new HashMap<>();

        ArrayList<String> header = sheetReader.header();

        for (int i = 1; i < header.size(); i++) {
            String cell = header.get(i);
            boolean hasPre = false;
            if (cell.startsWith("Pre_")) {
                cell = cell.substring(4);
                hasPre = true;
            }
            Parameter parameter = null;
            for (Parameter parameter1 : parameters) {
                if (parameter1.getName().equals(cell)) {
                    parameter = parameter1;
                }
            }
            if (hasPre) {
                guardColumns.put(parameter, i);
            } else {
                effectColumns.put(parameter, i);
            }
        }
        while (sheetReader.hasNext()) {
            ArrayList<String> row = sheetReader.nextRow();
            HashMap<Parameter, Guard> guards = new HashMap<>();
            HashMap<Parameter, Guard> effects = new HashMap<>();
            for (Parameter parameter : guardColumns.keySet()) {
                int column = guardColumns.get(parameter);
                String guardCell = row.get(column);
                if (RegexChecker.isGuard(guardCell)) {
                    guards.put(parameter, new Guard(guardCell));
                } else if (!guardCell.equals("N/A")) {
                    throw Error.combine(ErrorType.INVALID_GUARD, guardCell);
                }
            }
            for (Parameter parameter : effectColumns.keySet()) {
                int column = effectColumns.get(parameter);
                String guardCell = row.get(column);
                if (RegexChecker.isGuard(guardCell)) {
                    effects.put(parameter, new Guard(guardCell));
                } else if (!guardCell.equals("NO_CHANGE")) {
                    throw Error.combine(ErrorType.INVALID_EFFECT, guardCell);
                }
            }
            Transition transition = new Transition(row.get(0), guards, effects);
            transitionContainer.addTransition(transition);
        }
    }
}
