package gps.sia13.model;

public class ChainReactionCellState {

	public static enum FigureType {RECTANGLE, CIRCLE};
	public static enum Color {RED, GREEN};
	public static enum State {NOT_VISITED, VISITED, ACTUAL};

	public static final ChainReactionCellState RECTANGLE_RED = new ChainReactionCellState(FigureType.RECTANGLE, State.NOT_VISITED, Color.RED);
	public static final ChainReactionCellState RECTANGLE_GREEN = new ChainReactionCellState(FigureType.RECTANGLE, State.NOT_VISITED, Color.GREEN);
	public static final ChainReactionCellState CIRCLE_RED = new ChainReactionCellState(FigureType.CIRCLE, State.NOT_VISITED, Color.RED);
	public static final ChainReactionCellState CIRCLE_GREEN = new ChainReactionCellState(FigureType.CIRCLE, State.NOT_VISITED, Color.GREEN);

	public FigureType figureType;
	public Color color;
	public State state;

	public static ChainReactionCellState makeActual(ChainReactionCellState cellState) {
		return new ChainReactionCellState(cellState.figureType, State.ACTUAL, cellState.color);
	}

    public static ChainReactionCellState makeVisited(
            ChainReactionCellState cellState) {
        return new ChainReactionCellState(cellState.figureType, State.VISITED,
                cellState.color);
    }

	public ChainReactionCellState (FigureType figureType, State state, Color color) {
		this.figureType = figureType;
		this.state = state;
		this.color = color;
	}

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((color == null) ? 0 : color.hashCode());
        result = prime * result
                + ((figureType == null) ? 0 : figureType.hashCode());
        result = prime * result + ((state == null) ? 0 : state.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        ChainReactionCellState other = (ChainReactionCellState) obj;
        if (color != other.color)
            return false;
        if (figureType != other.figureType)
            return false;

        if (state != other.state) {
            if ( state == State.NOT_VISITED || other.state == State.NOT_VISITED) {
                return false;
            }
        }

        return true;
    }

	
}