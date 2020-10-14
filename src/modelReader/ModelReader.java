package modelReader;

import model.Component;
import model.Model;
import model.Parameter;
import modelReader.declaration.ParameterDetails;
import modelReader.declaration.ParameterInformation;
import modelReader.declaration.ParameterRange;
import modelReader.declaration.ParameterState;
import modelReader.fileReaders.MergedIOReader;
import modelReader.fileReaders.TransitionFileReader;
import utils.Log;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

public class ModelReader {
	private String mainFolderAddress;
	private File mergedIOFile;
	private ArrayList<File> transitionsFiles;
	private ArrayList<File> componentFolders;
	private Model model;

	public ModelReader(String mainFolderAddress) {
		this.mainFolderAddress = mainFolderAddress;
		this.transitionsFiles = new ArrayList<>();
		this.componentFolders = new ArrayList<>();
		this.validateSubFolders();

		HashMap<String, Parameter> parameters = new HashMap<>();
		HashMap<String, Component> components = new HashMap<>();

		for (File file : this.componentFolders) {
			Component component = new Component(file.getName());
			components.put(component.getName(), component);
		}
		MergedIOReader mergedIOReader = new MergedIOReader(this.mergedIOFile);
		ArrayList<ParameterInformation> informations = mergedIOReader.parse();
		for (ParameterInformation information : informations) {
			Parameter parameter = parameters.get(information.getName());
			if (parameter == null) {
				parameter = new Parameter(information.getName());
				parameters.put(information.getName(), parameter);
			}
			if (information instanceof ParameterDetails) {
				ParameterDetails details = ((ParameterDetails) information);
				parameter.setInitial(details.getInitial());
				Component owner = components.get(details.getOwner());
				owner.addOutputParameter(parameter);
				for (String componentName : details.getComponentNames()) {
					Component component = components.get(componentName);
					component.addParameter(parameter);
					if (component != owner) {
						component.addInputParameter(parameter);

					}
				}

			}
			if (information instanceof ParameterRange) {
				parameter.setValueRange(((ParameterRange) information).getValueRange());
			}
			if (information instanceof ParameterState) {
				parameter.addState(((ParameterState) information).getState());
			}

		}

		for (File componentFolder : this.componentFolders) {
			Component component = components.get(componentFolder.getName());
			File[] requirementsFiles = componentFolder.listFiles();
			assert requirementsFiles != null;
			for (File requirementsFile : requirementsFiles) {
				if (requirementsFile.getName().endsWith(".xlsx")) {
					TransitionFileReader.read(requirementsFile, component);
				}
			}
		}
		for (File transitionFile : this.transitionsFiles) {
			String name = transitionFile.getName();
			name = name.substring(0, name.indexOf(".xlsx"));
			Parameter parameter = parameters.get(name);
			Component component = null;
			for (Component c : components.values()) {
				if (c.getOutputParameters().contains(parameter)) {
					component = c;
				}
			}
			assert component != null;
			TransitionFileReader.read(transitionFile, component);
		}

		this.model = new Model();
		for (Component component : components.values()) {
			model.addComponent(component);
		}

	}


	private void validateSubFolders() {
		File mainFolder = new File(this.mainFolderAddress);
		if (!mainFolder.isDirectory()) {
			throw new IllegalStateException("main folder isnt a directory");
		}
		File[] subFiles = mainFolder.listFiles();
		assert subFiles != null;

		File allModulesFolder = null;
		for (File subFile : subFiles) {
			if (!subFile.isDirectory()) {
				throw new IllegalStateException("main folder has a non-directory subfile");
			}
			if (subFile.getName().equals("all_modules")) {
				allModulesFolder = subFile;
			} else {
				this.componentFolders.add(subFile);
			}
		}
		if (allModulesFolder == null) {
			throw new IllegalStateException("no all_modules found under main directory");
		}
		File[] allModulesSubFolder = allModulesFolder.listFiles();
		assert allModulesSubFolder != null;
		File transitionsFolder = null;
		for (File file : allModulesSubFolder) {
			if (!file.isDirectory() && file.getName().equals("merged_io.xlsx")) {
				this.mergedIOFile = file;
			}
			if (file.isDirectory() && file.getName().equals("transitions")) {
				transitionsFolder = file;
			}
		}
		if (this.mergedIOFile == null) {
			throw new IllegalStateException("no merged_io.xlsx file found under all_modules");
		}
		if (transitionsFolder == null) {
			throw new IllegalStateException("no transitions folder found under all_modules");
		}
		File[] transitionFiles = transitionsFolder.listFiles();
		assert transitionFiles != null;
		for (File transitionFile : transitionFiles) {
			if (transitionFile.isDirectory() || !transitionFile.getName().endsWith(".xlsx")) {
				Log.warning("Unused file " + transitionFile.getName());
			} else {
				this.transitionsFiles.add(transitionFile);
			}
		}
	}

	public Model getModel() {
		return model;
	}
}
