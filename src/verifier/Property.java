package verifier;

import model.*;
import net.automatalib.automata.fsa.DFA;
import net.automatalib.automata.graphs.TransitionEdge;
import net.automatalib.graphs.UniversalGraph;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

public class Property {
	private HashMap<String, ArrayList<Edge>> graph;
	private ArrayList<String> states;
	private String name;

	public Property(String name, HashMap<String, ArrayList<Edge>> graph, ArrayList<String> states) {
		this.name = name;
		this.graph = graph;
		this.states = states;
	}

	public HashMap<String, ArrayList<Edge>> getGraph() {
		return this.graph;
	}

	public ArrayList<String> getStates() {
		return this.states;
	}

	public Set<Action> getReadAlphabet() {
		Set<Action> actions = new HashSet<>();
		for (String state : this.states) {
			for (Edge edge : this.graph.get(state)) {
				actions.add(edge.readAction);
			}
		}
		return actions;
	}

	public Set<Action> getWriteAlphabet() {
		Set<Action> actions = new HashSet<>();
		for (String state : this.states) {
			for (Edge edge : this.graph.get(state)) {
				actions.add(edge.writeAction);
			}
		}
		return actions;
	}

	public Set<Channel> getChannels() {
		Set<Channel> channels = new HashSet<>();
		for (String state : this.states) {
			for (Edge edge : this.graph.get(state)) {
				channels.add(edge.writeAction.getChannel());
			}
		}
		return channels;
	}

	public Set<Parameter> getParameters() {
		Set<Parameter> parameters = new HashSet<>();
		for (String state : this.states) {
			for (Edge edge : this.graph.get(state)) {
				parameters.add(edge.writeAction.getChannel().getParameter());
			}
		}
		return parameters;
	}

	public static Property fromDFA(DFA<Integer, Action> conjecture, Set<Action> alphabetSet) {
		HashMap<String, ArrayList<Edge>> graph = new HashMap<>();
		ArrayList<String> states = new ArrayList<>();

		UniversalGraph<Integer, TransitionEdge<Action, Integer>, Boolean, TransitionEdge.Property<Action, Void>> g =
				conjecture.transitionGraphView(alphabetSet);
		String initialState = "Q_" + conjecture.getInitialState();
		String accept = null;
		for (Integer state : conjecture.getStates()) {
			String stateName = "Q_" + state;
			boolean isAccept = conjecture.isAccepting(state);
			if (isAccept) {
				accept = stateName;
				if (stateName.equals(initialState)) {
					states.add(0, stateName);
				} else {
					states.add(stateName);
				}
			}
			graph.put(stateName, new ArrayList<>());
		}
		if (accept == null) {
			accept = initialState;
		}
		for (Integer state : conjecture.getStates()) {
			String stateName = "Q_" + state;
			for (TransitionEdge<Action, Integer> e : g.getOutgoingEdges(state)) {
				Integer destinationState = e.getTransition();
				if (conjecture.isAccepting(destinationState)) {
					String destination = "Q_" + destinationState;
					State s = ((WriteAction) e.getInput()).getState();
					Action readAction = e.getInput().getChannel().getReadActionByState(s);
					Action writeAction = e.getInput().getChannel().getWriteActionByState(s);
					Edge edge = new Edge();
					edge.destination = destination;
					edge.readAction = readAction;
					edge.writeAction = writeAction;
					ArrayList<Edge> edges = graph.get(stateName);
					edges.add(edge);
					graph.put(stateName, edges);
				}

			}
		}
		return new Property("Conjecture", graph, states);
	}


	public String getName(String state) {
		return state;
	}

	public String getName() {
		return name;
	}
}
