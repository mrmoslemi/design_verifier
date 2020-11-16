package terminalInterface;

import com.google.common.base.Verify;
import model.Model;
import modelReader.ModelReader;
import modelReader.PropertyReader;
import verifier.Property;
import verifier.Result;
import verifier.Verifier;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
		List<Property> properties = PropertyReader.readFolder(this.propertiesFolder, model);
		String[] strategies = strategy.split("-");
		for (Property property : properties) {
			for (String strategy : strategies) {
				Verifier verifier = new Verifier(model, property, strategy);
				Result result = verifier.verify();
				System.out.println(result);
			}
		}
		return 1;
	}
}
