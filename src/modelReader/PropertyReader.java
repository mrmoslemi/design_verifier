package modelReader;


import model.Action;
import model.Model;
import model.Parameter;
import model.State;
import verifier.Edge;
import verifier.Property;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;

public class PropertyReader {

	public static Property read(String propertyAddress, Model model) {
		HashMap<String, ArrayList<Edge>> graph = new HashMap<>();
		ArrayList<String> states = new ArrayList<>();
		try {
			Scanner fileReader = new Scanner(new FileInputStream(propertyAddress));
			String[] nodes = fileReader.nextLine().split(", ");

			for (String node : nodes) {
				graph.put(node, new ArrayList<>());
				states.add(node);
			}
			while (fileReader.hasNextLine()) {
				String edgeString = fileReader.nextLine();
				String[] edgeParts = edgeString.split(", ");

				String source = edgeParts[0];
				String actionString = edgeParts[1];
				String destination = edgeParts[2];

				ArrayList<Edge> edges = graph.get(source);

				String parameterName = actionString.split("[.]")[0];
				String stateName = actionString.split("[.]")[1];
				Parameter parameter = model.getParameterByName(parameterName);
				State state = parameter.getStateByName(stateName);
				Action readAction = parameter.getInputChannel().getReadActionByState(state);
				Action writeAction = parameter.getInputChannel().getWriteActionByState(state);
				Edge edge = new Edge();
				edge.destination = destination;
				edge.readAction = readAction;
				edge.writeAction = writeAction;
				edges.add(edge);
				graph.put(source, edges);
			}
			return new Property(graph, states,states.get(0));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return null;
		}
	}
}
