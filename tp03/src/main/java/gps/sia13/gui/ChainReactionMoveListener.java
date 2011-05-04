package gps.sia13.gui;
import gps.sia13.model.ChainReactionBoard;
import gps.sia13.model.ChainReactionMove;
import gps.sia13.model.ChainReactionMoveHelper;

import java.util.List;

import d.g.boardgames.Board;
import d.g.boardgames.BoardEventListener;
import d.g.boardgames.BoardGUI;
import d.g.boardgames.Cell;


public class ChainReactionMoveListener implements BoardEventListener {

	ChainReactionRenderProperties renderProperties;
	BoardGUI boardGui;
	
	List <Cell> validMoves;
	Cell fromCell;

	public void boardAction(Board board, int row, int col) {
		// TODO Auto-generated method stub
		
	}

	private void selectCell (ChainReactionBoard board, Cell cell) {
		fromCell = cell;
		validMoves = ChainReactionMoveHelper.getValidMoves(board, fromCell) ;
		if (renderProperties != null) {
			renderProperties.setValidMoves(validMoves);
			renderProperties.setSelectedCell(fromCell);
		}
	}
	
	private void attemptMove (ChainReactionBoard board, Cell cell) {
		Cell toCell = cell;
		ChainReactionMove move = ChainReactionMoveHelper.getChainReactionMove(board, fromCell, toCell);

		ChainReactionBoard newBoard = (ChainReactionBoard) board.move(move);
		boardGui.setBoard(newBoard);
		validMoves = null;
		renderProperties.setValidMoves(null);
		renderProperties.setSelectedCell(null);
		fromCell = null;
	}

	public ChainReactionRenderProperties getRenderProperties() {
		return renderProperties;
	}

	public void setRenderProperties(ChainReactionRenderProperties renderProperties) {
		this.renderProperties = renderProperties;
	}

	public BoardGUI getBoardGui() {
		return boardGui;
	}

	public void setBoardGui(BoardGUI boardGui) {
		this.boardGui = boardGui;
	}
}
