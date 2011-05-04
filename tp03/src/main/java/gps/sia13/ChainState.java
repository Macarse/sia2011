package gps.sia13;

import gps.api.GPSState;

public class ChainState implements GPSState {

	public static final ChainState INIT_STATE = new ChainState();
	public static final ChainState GOAL_STATE = new ChainState();
	
	public boolean compare(GPSState state) {
		return this.equals(state);
	}
	
}
