package gps.sia13.model;

import d.g.boardgames.Cell;

public class ChainReactionMove {
	private Cell fromCell;
	private Cell toCell;

	public ChainReactionMove (Cell fromCell, Cell toCell) {
		this.fromCell = fromCell;
		this.toCell = toCell;
	}

	public Cell getFromCell() {
		return fromCell;
	}

	public void setFromCell(Cell fromCell) {
		this.fromCell = fromCell;
	}

	public Cell getToCell() {
		return toCell;
	}

	public void setToCell(Cell toCell) {
		this.toCell = toCell;
	}

	public String toString () {
		String retVal = "";
		if (fromCell != null) {
			retVal += fromCell + " ";
		}
		if (toCell != null) {
			retVal += toCell;
		}

		return retVal ;
	}
}