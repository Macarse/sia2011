package gps;

import gps.api.GPSProblem;
import gps.api.GPSRule;
import gps.api.GPSState;
import gps.exception.NotAppliableException;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;

public class GPSEngine {

	static private List<GPSNode> open = new LinkedList<GPSNode>();

	static private List<GPSNode> closed = new ArrayList<GPSNode>();

	static private GPSProblem problem;

	static private SearchStrategy strategy;

	public static void engine(GPSProblem myProblem, SearchStrategy myStrategy) {

		problem = myProblem;
		strategy = myStrategy;

		GPSNode rootNode = new GPSNode(problem.getInitState(), 0);
		boolean finished = false;
		boolean failed = false;
		long explosionCounter = 0;

		open.add(rootNode);
		while (!failed && !finished) {
			if (open.size() <= 0) {
				failed = true;
			} else {
				GPSNode currentNode = open.get(0);
				closed.add(currentNode);
				open.remove(0);
				if (isGoal(currentNode)) {
					finished = true;
					System.out.println(currentNode.getSolution());
					System.out.println("Expanded nodes: " + explosionCounter);
				} else {
					explosionCounter++;
					explode(currentNode);
				}
			}
		}

		if (finished) {
			System.out.println("OK! solution found!");
		} else if (failed) {
			System.err.println("FAILED! solution not found!");
		}
	}

	private static boolean isGoal(GPSNode currentNode) {
		return currentNode.getState() != null
				&& currentNode.getState().compare(problem.getGoalState());
	}

	private static boolean explode(GPSNode node) {
		if(problem.getRules() == null){
			System.err.println("No rules!");
			return false;
		}
		
		for (GPSRule rule : problem.getRules()) {
			GPSState newState = null;
			try {
				newState = rule.evalRule(node.getState());
			} catch (NotAppliableException e) {
				// Do nothing
			}
			if (newState != null
					&& !checkBranch(node, newState)
					&& !checkOpenAndClosed(node.getCost() + rule.getCost(),
							newState)) {
				GPSNode newNode = new GPSNode(newState, node.getCost()
						+ rule.getCost());
				newNode.setParent(node);
				addNode(newNode);
			}
		}
		return true;
	}

	private static void addNode(GPSNode node) {
		switch (strategy) {
		case BFS:
			open.add(node);
			break;
		case DFS:
			((LinkedList<GPSNode>) open).addFirst(node);
			break;
		case AStar:
			int index = Collections.binarySearch(open, node,
					new Comparator<GPSNode>() {

						public int compare(GPSNode o1, GPSNode o2) {
							Integer f1 = o1.getCost()
									+ problem.getHValue(o1.getState());
							Integer f2 = o2.getCost()
									+ problem.getHValue(o2.getState());
							if (f1 < f2) {
								return -1;
							} else if (f1 == f2) {
								return 0;
							} else {
								return 1;
							}
						}
					});
			if (index >= 0) {
				((LinkedList<GPSNode>) open).add(index, node);
			} else {
				((LinkedList<GPSNode>) open).add(-1 * (index + 1), node);
			}
			break;
		default:
			open.add(node);
			break;
		}
	}

	private static boolean checkOpenAndClosed(Integer cost, GPSState state) {
		for (GPSNode openNode : open) {
			if (openNode.getState().compare(state) && openNode.getCost() < cost) {
				return true;
			}
		}
		for (GPSNode closedNode : closed) {
			if (closedNode.getState().compare(state)
					&& closedNode.getCost() < cost) {
				return true;
			}
		}
		return false;
	}

	private static boolean checkBranch(GPSNode parent, GPSState state) {
		if (parent == null) {
			return false;
		}
		return checkBranch(parent.getParent(), state)
				|| state.compare(parent.getState());
	}

}
