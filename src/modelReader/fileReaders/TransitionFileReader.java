package modelReader.fileReaders;

import model.*;
import utils.Error;
import utils.ErrorType;
import utils.RegexChecker;
import utils.StringUtils;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

public class TransitionFileReader {

	private static HashMap<Parameter, Integer> guardColumns;
	private static HashMap<Parameter, Integer> effectColumns;
	private static SheetReader sheetReader;

	public static void read(File source, Component destination) {
		guardColumns = new HashMap<>();
		effectColumns = new HashMap<>();
		sheetReader = new SheetReader(source.getAbsolutePath());
		readHeader(destination);
		while (sheetReader.hasNext()) {
			readTransition(destination);
		}
	}

	private static void readHeader(Component destination) {
		ArrayList<Parameter> parameters = destination.getParameters();
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
	}

	private static void readTransition(Component destination) {
		ArrayList<String> row = sheetReader.nextRow();
		Action trigger = null;
		ArrayList<Guard> guards = new ArrayList<>();
		ArrayList<Action> effects = new ArrayList<>();
		for (Parameter parameter : guardColumns.keySet()) {
			int column = guardColumns.get(parameter);
			String guardCell = row.get(column);
			if (RegexChecker.isGuard(guardCell)) {
				guards.add(new Guard(parameter, guardCell));
				if (StringUtils.getGuardMode(guardCell) == Mode.T) {
					Channel inputChannel = parameter.getInputChannel();
					trigger = inputChannel.getAction(parameter.getEvaluation(guardCell).getState());
				}
			} else if (!guardCell.equals("N/A")) {
				throw Error.combine(ErrorType.INVALID_GUARD, guardCell);
			}
		}
		for (Parameter parameter : effectColumns.keySet()) {
			int column = effectColumns.get(parameter);
			String effectCell = row.get(column);
			if (RegexChecker.isMember(effectCell)) {
				Channel outputChannel = parameter.getOutputChannel();
				Action effect = outputChannel.getAction(parameter.getEvaluation(effectCell).getState());
				effects.add(effect);
				//TODO value effects!
//			} else if (!effectCell.equals("NO_CHANGE")) {
//				throw Error.combine(ErrorType.INVALID_EFFECT, effectCell);
			}
		}
		Transition transition = new Transition(row.get(0), trigger, guards, effects);
		destination.addTransition(transition);
	}
}
