/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const R: number = parseInt(readline());
const C: number = parseInt(readline());
const T: number = parseInt(readline());

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Grid {
    rows: Row[];

    constructor() {
        this.rows = [];
    }

    addRow: (row: Row) => void = (row: Row): void => {
        this.rows.push(row);
    };

    checkReachableCells: (threshold: number) => void = (threshold: number): void => {
        const bottomRow: Row = this.rows[this.rows.length - 1];
        const bottomRightCell: Cell = bottomRow.cells[bottomRow.cells.length - 1];

        this.checkReachableCell(bottomRightCell.y, bottomRightCell.x, threshold);
    };

    checkReachableCell: (targetY: number, targetX: number, threshold: number) => boolean = (targetY: number, targetX: number, threshold: number): boolean => {
        const targetCell: Cell = this.rows[targetY].cells[targetX];

        if (targetCell.isReachable !== undefined) {
            return targetCell.isReachable;
        }

        const accessibleValue: boolean = targetCell.value <= threshold;
        const isUpperLeftCell: boolean = targetCell.y === 0 && targetCell.x === 0;
        const topCellIsReachable: boolean = targetCell.y !== 0 ? this.checkReachableCell(targetCell.y - 1, targetCell.x, threshold) : false;
        const leftCellIsReachable: boolean = targetCell.x !== 0 ? this.checkReachableCell(targetCell.y, targetCell.x - 1, threshold) : false;

        const isReachableCell: boolean = isUpperLeftCell || topCellIsReachable || leftCellIsReachable;
        this.rows[targetY].cells[targetX].isReachable = accessibleValue && isReachableCell;

        return this.rows[targetY].cells[targetX].isReachable;
    };

    countReachableCell: () => number = (): number => {
        return this.rows.flatMap(row => row.cells).filter(cell => cell.isReachable).length;
    };
}

class Row {
    cells: Cell[];

    constructor() {
        this.cells = [];
    }

    addCell: (cell: Cell) => void = (cell: Cell): void => {
        this.cells.push(cell);
    }
}

class Cell {
    y: number;
    x: number;
    value: number;
    isReachable: boolean;

    constructor(y: number, x: number, value: number) {
        this.y = y;
        this.x = x;
        this.value = value;
    }
}

const sumRIndexDigits: number[] = [...Array(R).keys()].map(index => {
    return index.toString().split('').map(char => parseInt(char)).reduce((sum, i) => sum + i);
});
const sumCIndexDigits: number[] = [...Array(C).keys()].map(index => {
    return index.toString().split('').map(char => parseInt(char)).reduce((sum, i) => sum + i);
});

const grid: Grid = new Grid();
sumRIndexDigits.forEach((rowSum, rowIndex) => {
    const row: Row = new Row();
    sumCIndexDigits.forEach((columnSum, columnIndex) => {
        const cell: Cell = new Cell(rowIndex, columnIndex, rowSum + columnSum);
        row.addCell(cell);
    });

    grid.addRow(row);
});

grid.checkReachableCells(T);

const result: number = grid.countReachableCell();

// console.log('answer');
console.log(result);
