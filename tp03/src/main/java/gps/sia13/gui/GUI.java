package gps.sia13.gui;

import gps.sia13.model.ChainReactionBoard;

import java.awt.Dimension;

import javax.swing.JFrame;

import d.g.boardgames.BoardGUI;


public class GUI extends JFrame {
	private static final long serialVersionUID = 1L;
	private static GUI instance;
	
	public static GUI getInstance() {
	    if ( instance == null ) {
	        return new GUI();
	    }

	    return instance;
	}

    private BoardGUI boardGUI;

	private GUI() {
		setSize (new Dimension (640, 480));
		ChainReactionBoard board = new ChainReactionBoard();
		boardGUI = new BoardGUI(board) ;

		ChainReactionRenderProperties renderProperties = new ChainReactionRenderProperties();
		boardGUI.setBoardRenderProperties(renderProperties);

		ChainReactionMoveListener moveListener = new ChainReactionMoveListener();
		moveListener.setRenderProperties(renderProperties);

		moveListener.setBoardGui(boardGUI);
		boardGUI.addBoardEventListener(moveListener);

		add (boardGUI) ;
		setVisible(true) ;
	}

	public void setBoard(ChainReactionBoard board) {
	    boardGUI.setBoard(board);
	}
	
	public static void main(String[] args) {
		new GUI();
	}
}
