package gps.sia13.model;

import gps.api.GPSRule;
import gps.sia13.problem.ChainReactionRule;
import junit.framework.TestSuite;

import org.junit.Test;


public class ChainReactionBoardTest extends TestSuite {

    @Test
    public void adjacentTest() {
        ChainReactionBoard board = new ChainReactionBoard();
        for (GPSRule gpsRule : ChainReactionRule.getRules()) {
            ChainReactionRule rule = (ChainReactionRule) gpsRule; 
            board.getAdjacentCell(rule.getDelta());
        }
    }
}
