package terminalInterface;

import model.Model;
import modelReader.ModelReader;
import modelReader.PropertyReader;
import verifier.Property;
import verifier.Verifier;

public class VerifyCommand extends Command {
	private String modelAddress;
	private String propertiesFolder;

	public VerifyCommand(String modelAddress, String propertiesFolder) {
		this.modelAddress = modelAddress;
		this.propertiesFolder = propertiesFolder;
	}

	@Override
	public int run() {
		ModelReader modelReader = new ModelReader(this.modelAddress);
		Model model = modelReader.getModel();
		Property property = PropertyReader.read(this.propertiesFolder, model);
		Verifier.verify(model, property);
		return 1;
	}
}
