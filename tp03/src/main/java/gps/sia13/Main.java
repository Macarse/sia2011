package gps.sia13;

import gps.GPSEngine;
import gps.SearchStrategy;
import gps.sia13.gui.GUI;
import gps.sia13.problem.ChainReactionProblem;


public class Main {
	public static void main(String[] args) {
	    GUI.getInstance();
		GPSEngine.engine(new ChainReactionProblem(), SearchStrategy.DFS);
	}
}
