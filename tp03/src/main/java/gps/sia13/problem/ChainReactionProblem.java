package gps.sia13.problem;
import gps.api.GPSProblem;
import gps.api.GPSRule;
import gps.api.GPSState;
import gps.sia13.model.ChainReactionBoard;
import gps.sia13.model.ChainReactionCellState;

import java.util.List;

public class ChainReactionProblem implements GPSProblem {

    public GPSState getInitState() {
        ChainReactionBoard board = new ChainReactionBoard(2, 2);

        board.setCellState(0, 0,
                ChainReactionCellState
                .makeActual(ChainReactionCellState.RECTANGLE_GREEN));
        board.setCellState(0, 1, ChainReactionCellState.RECTANGLE_RED);
        board.setCellState(1, 0, ChainReactionCellState.CIRCLE_GREEN);
        board.setCellState(1, 1, ChainReactionCellState.CIRCLE_RED);

        return board;
    }

    public GPSState getGoalState() {
        ChainReactionBoard board = new ChainReactionBoard(2, 2);

        board.setCellState(0, 0,
                ChainReactionCellState
                .makeVisited(ChainReactionCellState.RECTANGLE_GREEN));
        board.setCellState(0, 1, ChainReactionCellState
                .makeVisited(ChainReactionCellState.RECTANGLE_RED));
        board.setCellState(1, 0, ChainReactionCellState
                .makeVisited(ChainReactionCellState.CIRCLE_GREEN));
        board.setCellState(1, 1, ChainReactionCellState
                .makeVisited(ChainReactionCellState.CIRCLE_RED));

        return board;
    }

    public List<GPSRule> getRules() {
        return ChainReactionRule.getRules();
    }

    public Integer getHValue(GPSState state) {
        ChainReactionBoard board = (ChainReactionBoard) state;

        if ( board.isComplete() ) {
            return 0;
        } else {
            return 1;
        }
    }

}
