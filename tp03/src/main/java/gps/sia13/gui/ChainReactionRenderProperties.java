package gps.sia13.gui ;
import gps.sia13.model.ChainReactionBoard;
import gps.sia13.model.ChainReactionCellState;

import java.awt.Color;
import java.awt.Image;
import java.util.List;

import javax.imageio.ImageIO;

import d.g.boardgames.Cell;
import d.g.boardgames.DefaultBoardRenderProperties;
import d.g.boardgames.chess.ChessBoard;

public class ChainReactionRenderProperties extends DefaultBoardRenderProperties<ChainReactionBoard> {

	Cell selectedCell;
	List<Cell> validMoves;

	Color red = new Color(0xff, 0x00, 0x00);
	Color green = new Color(0x00, 0xff, 0x00);
	Color white = new Color(0x00, 0x00, 0x00);
	Color black = new Color(0xff, 0xff, 0xff, 0x0A);
	
	Image backgroundImage;
	Image rectangle;
	Image circle;
	Image redCross;
	Image greenCross;

	Image bottomBorder;
	Image topBorder;
	Image leftBorder;
	Image rightBorder;

	public ChainReactionRenderProperties () {
		this("default");
	}
	
	public ChainReactionRenderProperties (String theme) {
		try {
			circle = ImageIO.read(getClass().getResource("/circle.png"));
			rectangle = ImageIO.read(getClass().getResource("/rectangle.png"));
			redCross = ImageIO.read(getClass().getResource("/red_cross.png"));
			greenCross = ImageIO.read(getClass().getResource("/green_cross.png"));
		} catch (Exception e) {
			e.printStackTrace() ;
		}
	}

	public Image getBackgroundImage () {
		return backgroundImage ;
	}

	@Override
	public Color getCellColor (ChainReactionBoard board, int row, int col) {
		ChainReactionCellState cellState = board.getCellState(row, col);
		if (cellState == null)
			return null;

		switch (cellState.state) {
		case ACTUAL: return white;
		case VISITED: return black;
		
		default:
		    break;
		}

		switch (cellState.color) {
				case RED: return red;
				case GREEN: return green;
				default: break;
			}


		return null;
	}
	
	public Image getCellImage (ChainReactionBoard board, int row, int col) {
		ChainReactionCellState cellState = board.getCellState(row, col);
		if (cellState == null)
			return null ;

		switch (cellState.figureType) {
				case CIRCLE: return circle;
				case RECTANGLE: return rectangle;
				default: break;
			}

		return null;
	}

	public Image getBottomBorder (boolean flip) {
		if (!flip) {
			return bottomBorder ;
		} else {
			return null;
		}
	}
	
	public Image getTopBorder (boolean flip) {
		if (flip) {
			return topBorder ;
		} else {
			return null;
		}
	}
	
	public Image getLeftBorder (boolean flip) {
		if (!flip) {
			return leftBorder ;
		} else {
			return null;
		}
	}
	
	public Image getRightBorder (boolean flip) {
		if (flip) {
			return rightBorder ;
		} else {
			return null;
		}
	}
	
	public Color getCellBorderColor (ChessBoard board, int row, int col) {
		Cell cell = new Cell(row, col);
		if (selectedCell != null && selectedCell.equals(cell)) {
			return Color.RED;
		}
		if (validMoves != null && validMoves.contains(cell)) {
			return Color.GREEN;
		}
		return null;
	}
	
	public boolean isGridOn() {
		return true;
	}

	public Cell getSelectedCell() {
		return selectedCell;
	}

	public void setSelectedCell(Cell selectedCell) {
		this.selectedCell = selectedCell;
	}

	public List<Cell> getValidMoves() {
		return validMoves;
	}

	public void setValidMoves(List<Cell> validMoves) {
		this.validMoves = validMoves;
	}
	
	public float getPaddingX() {
		return 10;
	}

	public float getPaddingY() {
		return 10;
	}

	public float getOffsetY() {
		return 0;
	}

}
