package terminalInterface;

import model.Model;
import modelReader.ModelReader;
import modelReader.PropertyReader;
import verifier.Property;
import verifier.Result;
import verifier.Verifier;

public class VerifyCommand extends Command {
	private String modelAddress;
	private String propertiesFolder;
	private String strategy;

	public VerifyCommand(String modelAddress, String propertiesFolder, String strategy) {
		this.modelAddress = modelAddress;
		this.propertiesFolder = propertiesFolder;
		this.strategy = strategy;
	}

	@Override
	public int run() {
		ModelReader modelReader = new ModelReader(this.modelAddress);
		Model model = modelReader.getModel();
		Property property = PropertyReader.read(this.propertiesFolder, model);
		Result result = Verifier.verify(model, property, strategy);
		System.out.println(result);
		return 1;
	}
}
