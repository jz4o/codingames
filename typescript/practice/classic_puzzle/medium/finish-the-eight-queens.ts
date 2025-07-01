/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const rows: string[] = [];
for (let i = 0; i < 8; i++) {
    const row: string = readline();
    rows.push(row);
}
// for (let i = 0; i < 8; i++) {
//
//     // Write an answer using console.log()
//     // To debug: console.error('Debug messages...');
//
//     console.log('row');
// }

interface Cell {
    rowIndex: number;
    columnIndex: number;
    value: string;
}

class Board {
    grid: Cell[][];
    candidateCells: Cell[];
    queenCount: number;

    static BOARD_SIZE: number = 8;
    static QUEEN: string = 'Q';

    constructor(rows: string[]) {
        this.grid = rows.map((row, rowIndex) => {
            return row.split('').map((value, columnIndex) => {
                return { rowIndex, columnIndex, value };
            });
        });
        this.candidateCells = this.grid.flat();

        this.queenCount = 0;
        const queenCells: Cell[] = this.candidateCells.filter(cell => cell.value === Board.QUEEN);
        queenCells.forEach(queenCell => {
            this.fillCell(queenCell);
        });
    }

    fill: () => boolean = (): boolean => {
        let isFilled: boolean = false;
        [...Array(Board.BOARD_SIZE).keys()].forEach(index => {
            const rowCandidateCells: Cell[] = this.candidateCells.filter(cell => cell.rowIndex === index);
            if (rowCandidateCells.length === 1) {
                const [fillCell]: Cell[] = rowCandidateCells;
                this.fillCell(fillCell);

                isFilled = true;
            }

            const columnCandidateCells: Cell[] = this.candidateCells.filter(cell => cell.columnIndex === index);
            if (columnCandidateCells.length === 1) {
                const [fillCell]: Cell[] = columnCandidateCells;
                this.fillCell(fillCell);

                isFilled = true;
            }
        });

        return isFilled;
    };

    fillCell: (cell: Cell) => void = (cell: Cell): void => {
        this.grid[cell.rowIndex][cell.columnIndex].value = Board.QUEEN;
        this.queenCount++;

        this.#removeCandidateCells(cell);
    };

    getCandidateChallengeFillCells: () => Cell[] = (): Cell[] => {
        const candidatesCells: Cell[][] = [...Array(Board.BOARD_SIZE).keys()].map(index => {
            return this.candidateCells.filter(cell => cell.rowIndex === index || cell.columnIndex === index);
        });

        const [candidateCells]: Cell[][] = candidatesCells
            .filter(candidateCells => candidateCells.length > 0)
            .sort((a, b) => a.length - b.length);

        return candidateCells;
    };

    isFinished: () => boolean = (): boolean => {
        return this.queenCount === Board.BOARD_SIZE;
    };

    getRowValues: () => string[] = (): string[] => {
        return this.grid.map(row => {
            return row.map(cell => cell.value).join('');
        });
    };

    #removeCandidateCells: (queenCell: Cell) => void = (queenCell: Cell): void => {
        this.candidateCells = this.candidateCells.filter(cell => {
            return cell.rowIndex !== queenCell.rowIndex
                && cell.columnIndex !== queenCell.columnIndex
                && Math.abs(cell.rowIndex - queenCell.rowIndex) !== Math.abs(cell.columnIndex - queenCell.columnIndex);
        });
    };
}

const boards: Board[] = [new Board(rows)];
let finishedBoard: Board;
while (boards.length > 0 && !finishedBoard) {
    const board: Board = boards.shift();

    while (board.fill()) {
        // fill to the limit
    }

    if (board.isFinished()) {
        finishedBoard = board;
        break;
    }

    const candidateCells: Cell[] = board.getCandidateChallengeFillCells();
    const boardRowValues: string[] = board.getRowValues();
    candidateCells.forEach(cell => {
        const newBoard: Board = new Board(boardRowValues);
        newBoard.fillCell(cell);

        boards.push(newBoard);
    });
}

if (!finishedBoard) {
    throw Error("can't solution");
}

const results: string[] = finishedBoard.getRowValues();

results.forEach(result => {
    console.log(result);
});

