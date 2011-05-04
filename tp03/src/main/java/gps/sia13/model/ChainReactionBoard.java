package gps.sia13.model;

import gps.api.GPSState;
import gps.sia13.gui.GUI;
import d.g.boardgames.Board;
import d.g.boardgames.Cell;

public class ChainReactionBoard extends
        Board<ChainReactionCellState, ChainReactionMove> implements GPSState {

    public ChainReactionBoard(int row, int col) {
        super(row, col);
    }

    public ChainReactionBoard() {
        super(2, 2);
        setCellState(0, 0,
                ChainReactionCellState
                        .makeActual(ChainReactionCellState.RECTANGLE_GREEN));
        setCellState(0, 1, ChainReactionCellState.RECTANGLE_RED);
        setCellState(1, 0, ChainReactionCellState.CIRCLE_GREEN);
        setCellState(1, 1, ChainReactionCellState.CIRCLE_RED);
    }

    public boolean isComplete() {
        for (int row = 0; row < getRowCount(); row++) {
            for (int col = 0; col < getColCount(); col++) {
                ChainReactionCellState cellState = getCellState(row, col);
                if ( cellState.state == ChainReactionCellState.State.NOT_VISITED ) {
                    return false;
                }
            }
        }

        return true;
    }

    @Override
    public Board<ChainReactionCellState, ChainReactionMove> clone() {
        ChainReactionBoard ret = new ChainReactionBoard(getRowCount(),
                getColCount());

        for (int row = 0; row < getRowCount(); row++) {
            for (int col = 0; col < getColCount(); col++) {
                ret.setCellState(row, col, getCellState(row, col));
            }
        }

        return ret;
    }

    /* TODO: IMPROVE THIS */
    public Cell getActualCoordinates() {
        for (int row = 0; row < getRowCount(); row++) {
            for (int col = 0; col < getColCount(); col++) {
                ChainReactionCellState cellState = getCellState(row, col);
                if ( cellState.state.equals(ChainReactionCellState.State.ACTUAL) )
                    return new Cell(row, col);
            }
        }

        return null;
    }

    public ChainReactionCellState getAdjacentState(Cell delta) {
        Cell adjacentCell = getAdjacentCell(delta);
        return getCellState(adjacentCell);
    }

    public Cell getAdjacentCell(Cell delta) {
        Cell coordinate = getActualCoordinates();

        int a = (coordinate.getRow() + delta.getRow()) % getRowCount();
        if ( a < 0 ) {
            a += getRowCount();
        }

        int b = (coordinate.getCol() + delta.getCol()) % getColCount();
        if ( b < 0 ) {
            b+= getColCount();
        }

        return new Cell(a, b);
    }

    public boolean compare(GPSState state) {
        ChainReactionBoard board = (ChainReactionBoard) state;

        if ( board.getRowCount() != getRowCount() ) {
            return false;
        }

        if ( board.getColCount() != getColCount() ) {
            return false;
        }

        for (int row = 0; row < getRowCount(); row++) {
            for (int col = 0; col < getColCount(); col++) {
                ChainReactionCellState otherState = board.getCellState(row, col);
                ChainReactionCellState myState = getCellState(row, col);
                if ( !otherState.equals(myState) ) {
                    return false;
                }
            }
        }

        return true;
    }

    public ChainReactionCellState getActualCellState() {
        return getCellState(getActualCoordinates());
    }

    @Override
    public String toString() {
        GUI gui = GUI.getInstance();
        gui.setBoard(this);
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return super.toString();
    }
}