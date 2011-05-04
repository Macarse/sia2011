package gps.sia13.model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import d.g.boardgames.Cell;
import d.g.boardgames.Ray;


public class ChainReactionMoveHelper {
    static ArrayList<Ray> movementsList;

    static {
        movementsList = new ArrayList<Ray>();
        movementsList.add(new Ray(Arrays.asList(new Cell[] {new Cell(-1, 0)}))) ;
    }
	static public List<Cell> getPossibleMoves(ChainReactionBoard board, Cell forCell) {
		List<Cell> validMoveList = new ArrayList<Cell>();

		return validMoveList;
	}

	public static ChainReactionMove getChainReactionMove(ChainReactionBoard board,
			Cell fromCell, Cell toCell) {
		return null;
	}

	public static List<Cell> getValidMoves(ChainReactionBoard board,
			Cell fromCell) {
		return null;
	}
}
