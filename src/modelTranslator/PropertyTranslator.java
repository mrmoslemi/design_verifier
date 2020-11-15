package modelTranslator;

import verifier.Edge;
import verifier.Property;

import java.util.ArrayList;
import java.util.HashMap;

public class PropertyTranslator {
	public static String translateAsTrace(Property property) {
		HashMap<String, ArrayList<Edge>> graph = property.getGraph();
		StringBuilder traceBody = new StringBuilder();
		for (String source : property.getStates()) {
			ArrayList<Edge> edges = graph.get(source);
			StringBuilder edgesBody = new StringBuilder();
			for (Edge edge : edges) {
				edgesBody.append(String.format("\t\t::%s -> goto %s;\n", edge.readAction, property.getName(edge.destination)));
			}
			if (edges.size() > 0) {
				traceBody.append(String.format("\t%s: if\n%s\tfi;\n", property.getName(source), edgesBody.toString()));
			} else {
				traceBody.append(String.format("\t%s:", property.getName(source)));
			}
		}
		return String.format("trace{\n%s\n}\n", traceBody.toString());
	}

	public static String translateAsProcess(Property property) {
		HashMap<String, ArrayList<Edge>> graph = property.getGraph();
		StringBuilder traceBody = new StringBuilder();
		for (String source : property.getStates()) {
			ArrayList<Edge> edges = graph.get(source);
			StringBuilder edgesBody = new StringBuilder();
			for (Edge edge : edges) {
				edgesBody.append(String.format("\t\t::%s -> goto %s;\n", edge.writeAction, property.getName(edge.destination)));
			}
			if (edges.size() > 0) {
				traceBody.append(String.format("\t%s: if\n%s\tfi;\n", property.getName(source), edgesBody.toString()));
			} else {
				traceBody.append(String.format("\t%s:", property.getName(source)));
			}
		}
		return String.format("active proctype assumption(){\n%s\n}\n", traceBody.toString());
	}
}
