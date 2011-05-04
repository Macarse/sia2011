package gps.sia13.problem;

import gps.api.GPSRule;
import gps.api.GPSState;
import gps.exception.NotAppliableException;
import gps.sia13.model.ChainReactionBoard;
import gps.sia13.model.ChainReactionCellState;

import java.util.ArrayList;
import java.util.List;

import d.g.boardgames.Cell;

public class ChainReactionRule implements GPSRule {
    private static final Cell MOVE_LEFT = new Cell(-1, 0);
    private static final Cell MOVE_RIGHT = new Cell(1, 0);
    private static final Cell MOVE_UP = new Cell(0, 1);
    private static final Cell MOVE_DOWN = new Cell(0, -1);

    public static List<GPSRule> getRules() {
        List<GPSRule> ret = new ArrayList<GPSRule>(4);

        ret.add(new ChainReactionRule(MOVE_LEFT));
        ret.add(new ChainReactionRule(MOVE_RIGHT));
        ret.add(new ChainReactionRule(MOVE_UP));
        ret.add(new ChainReactionRule(MOVE_DOWN));

        return ret;
    }

    private Cell delta;

    public Cell getDelta() {
        return delta;
    }

    public ChainReactionRule(Cell cell) {
        this.delta = cell;
    }

    public GPSState evalRule(GPSState state) throws NotAppliableException {
        ChainReactionBoard oldBoard = (ChainReactionBoard) state;
        ChainReactionCellState adjacent = oldBoard.getAdjacentState(this.delta);
        ChainReactionCellState current = oldBoard.getActualCellState();

        if ( adjacent.state != ChainReactionCellState.State.NOT_VISITED ) {
            throw new NotAppliableException();
        }

        if ( current.color != adjacent.color &&
                current.figureType != adjacent.figureType ) {
            throw new NotAppliableException();
        }

        //get the new state.
        ChainReactionBoard newBoard = (ChainReactionBoard) oldBoard.clone();

        // Make the adjacent state the new actual.
        ChainReactionCellState newActual = ChainReactionCellState.makeActual(oldBoard.getAdjacentState(delta));
        newBoard.setCellState(oldBoard.getAdjacentCell(delta), newActual);

        // Make the last visited visited.
        ChainReactionCellState lastVisited = ChainReactionCellState.makeVisited(oldBoard.getActualCellState());
        newBoard.setCellState(oldBoard.getActualCoordinates(), lastVisited);


        return newBoard;
    }

    public Integer getCost() {
        return 2;
    }

    public String getName() {
        return "secho rule";
    }

}
