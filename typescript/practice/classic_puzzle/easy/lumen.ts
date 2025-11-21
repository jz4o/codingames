/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const L: number = parseInt(readline());
const cellGrid: string[][] = [];
for (let i = 0; i < N; i++) {
    const inputs: string[] = readline().split(' ');
    const cellRow: string[] = [];
    for (let j = 0; j < N; j++) {
        const cell: string = inputs[j];
        cellRow.push(cell);
    }
    cellGrid.push(cellRow);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo: (from: number, to: number) => number[] = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
};

type Position = {
    rowIndex: number,
    columnIndex: number
};

const LIGHT_SPOT: string = 'O';
const DARK_SPOT: string = 'X';

const paddingRow: string[] = Array(L * 2 + N).fill(LIGHT_SPOT);
const paddingColumn: string[] = Array(L).fill(LIGHT_SPOT);

const grid: string[][] = cellGrid.map(cellRow => {
    return [...paddingColumn, ...cellRow, ...paddingColumn];
});

[...Array(L).keys()].forEach(() => {
    grid.unshift(paddingRow);
    grid.push(paddingRow);
});

const cPositions: Position[] = grid.flatMap((row, rowIndex) => {
    return row
        .map((value, columnIndex) => value === 'C' ? { rowIndex, columnIndex } : null)
        .filter(position => position);
});

const replaceLightSize: number = L * 2 - 1;
const replaceLightSpots: string[] = Array(replaceLightSize).fill(LIGHT_SPOT);
cPositions.forEach(cPosition => {
    const cRowIndex: number = cPosition.rowIndex;
    const cColumnIndex: number = cPosition.columnIndex;

    rangeArrayFromTo(cRowIndex - L + 1, cRowIndex + L - 1).forEach(rowIndex => {
        grid[rowIndex].splice(cColumnIndex - L + 1, replaceLightSize, ...replaceLightSpots);
    });
});

const result: number = grid.flat().filter(value => value === DARK_SPOT).length;

// console.log('2');
console.log(result);
