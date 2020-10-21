package modelReader.fileReaders;

import model.Evaluation;
import model.State;
import model.ValueRange;
import modelReader.declaration.ParameterDetails;
import modelReader.declaration.ParameterInformation;
import modelReader.declaration.ParameterRange;
import modelReader.declaration.ParameterState;
import utils.Error;
import utils.ErrorType;
import utils.Log;
import utils.RegexChecker;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;

public class MergedIOReader {

	private static final String NAME = "System Parameters";
	private static final String VALUE_MEMBER = "Value Members";
	private static final String INITIAL = "Initial Value";
	private static final String DEPENDENCIES = "Module Name";
	private static final String OWNER = "Owner";

	private File file;
	private SheetReader sheetReader;

	public MergedIOReader(File file) {
		this.file = file;
		this.sheetReader = new SheetReader(file.getAbsolutePath());
		this.initColumns();
	}

	private void initColumns() {
		ArrayList<String> header = this.sheetReader.header();
		if (!header.get(0).equals(NAME)) {
			throw Error.combine(ErrorType.COLUMN_MISSING, NAME, this.file.getAbsolutePath());
		}
		if (!header.get(1).equals(VALUE_MEMBER)) {
			throw Error.combine(ErrorType.COLUMN_MISSING, VALUE_MEMBER, this.file.getAbsolutePath());
		}
		if (!header.get(2).equals(INITIAL)) {
			throw Error.combine(ErrorType.COLUMN_MISSING, INITIAL, this.file.getAbsolutePath());
		}
		if (!header.get(3).equals(DEPENDENCIES)) {
			throw Error.combine(ErrorType.COLUMN_MISSING, DEPENDENCIES, this.file.getAbsolutePath());
		}
		if (!header.get(4).equals(OWNER)) {
			throw Error.combine(ErrorType.COLUMN_MISSING, OWNER, this.file.getAbsolutePath());
		}
	}


	public ArrayList<ParameterInformation> parse() {
		ArrayList<ParameterInformation> parameterInformations = new ArrayList<>();
		while (sheetReader.hasNext()) {
			ArrayList<String> row = sheetReader.nextRow();
			if(row.get(0).length()>0){
				ParameterInformation parameterInformation = this.parseRow(row);
				parameterInformations.add(parameterInformation);
			}

		}
		return parameterInformations;
	}

	private ParameterInformation parseRow(ArrayList<String> row) {
		String valueMember = row.get(1);
		if (valueMember.equals("All")) {
			return this.readDeclarationLine(row);
		} else if (RegexChecker.isRange(valueMember)) {
			return this.readRangeLine(row);
		} else if (RegexChecker.isMember(valueMember)) {
			return this.readStateLine(row);
		} else {
			throw Error.combine(ErrorType.INVALID_VALUE_MEMBER, valueMember);
		}
	}

	private ParameterDetails readDeclarationLine(ArrayList<String> row) {
		String name = row.get(0);
		String initialString = row.get(2);
		//TODO fix me
		Evaluation initial = new Evaluation(new State(null, "a"), 1);
		String[] componentNames = row.get(3).split("\n");
		String owner = row.get(4);
		ArrayList<String> componentsNamesArrayList = new ArrayList<>(Arrays.asList(componentNames));
		ParameterDetails toReturn = new ParameterDetails(name, initial, componentsNamesArrayList);
		toReturn.setOwner(owner);
		return toReturn;
	}

	private ParameterRange readRangeLine(ArrayList<String> row) {
		String name = row.get(0);
		String valueMember = row.get(1);
		ValueRange valueRange = new ValueRange(valueMember);
		return new ParameterRange(name, valueRange);
	}

	private ParameterState readStateLine(ArrayList<String> row) {
		String name = row.get(0);
		String valueMember = row.get(1);
		String state = valueMember.substring(2);
		return new ParameterState(name, state);
	}
}
