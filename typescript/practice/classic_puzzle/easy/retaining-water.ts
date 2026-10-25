/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline(), 10);
const lines: string[] = [];
for (let i = 0; i < N; i++) {
    const line: string = readline();
    lines.push(line);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

interface Cell {
    row: number;
    column: number;
    height: number;
    hold: number;
    isOverflow: boolean;
    isHolded: boolean;
}

const ALPHABETS: string[] = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');

const grid: Cell[][] = lines.map((line, rowIndex) => {
    return line.split('').map((value, columnIndex) => {
        return {
            row: rowIndex,
            column: columnIndex,
            height: ALPHABETS.indexOf(value) + 1,
            hold: 0,
            isOverflow: false,
            isHolded: false
        };
    });
});

grid.at(0).forEach(cell => cell.isOverflow = true);
grid.at(-1).forEach(cell => cell.isOverflow = true);
grid.forEach(row => {
    row.at(0).isOverflow = true;
    row.at(-1).isOverflow = true;
});

const overflowCells: Cell[] = grid.flat().filter(cell => cell.isOverflow);
const overflowCellsToChecks: Cell[] = [...overflowCells];
while (overflowCellsToChecks.length > 0) {
    const cell: Cell = overflowCellsToChecks.shift();

    const aroundCell: Cell[] = [
        grid[Math.max(cell.row - 1, 0)][cell.column],
        grid[cell.row][Math.max(cell.column - 1, 0)],
        grid[cell.row][Math.min(cell.column + 1, N - 1)],
        grid[Math.min(cell.row + 1, N - 1)][cell.column],
    ].filter(c => !c.isOverflow && cell.height <= c.height);

    const nextOverflowCellsToChecks: Cell[] = aroundCell.filter(c => {
        return !overflowCellsToChecks.includes(c) && !overflowCells.includes(c);
    });
    nextOverflowCellsToChecks.forEach(c => c.isOverflow = true);

    overflowCellsToChecks.push(...nextOverflowCellsToChecks);
    overflowCells.push(...nextOverflowCellsToChecks);
}

const holdCells: Cell[] = [...new Set(overflowCells)].sort((a, b) => a.height - b.height);
holdCells.forEach(cell => cell.isHolded = true);
const holdCellsToChecks: Cell[] = [...holdCells];
while (holdCellsToChecks.length > 0) {
    const cell: Cell = holdCellsToChecks.shift();

    const aroundCell: Cell[] = [
        grid[Math.max(cell.row - 1, 0)][cell.column],
        grid[cell.row][Math.max(cell.column - 1, 0)],
        grid[cell.row][Math.min(cell.column + 1, N - 1)],
        grid[Math.min(cell.row + 1, N - 1)][cell.column],
    ];

    const nextChecks: Cell[] = aroundCell.filter(c => !c.isHolded && c.height <= cell.height);
    nextChecks.forEach(c => {
        c.hold = Math.max(cell.height - c.height, 0);
        c.height = cell.height;
        c.isHolded = true;

        holdCellsToChecks.unshift(c);
    });

    aroundCell.forEach(c => {
        if (c.height <= cell.height) {
            return;
        }

        c.isOverflow = true;
        c.isHolded = true;

        const insertIndex: number = holdCellsToChecks.some(cc => c.height <= cc.height)
            ? holdCellsToChecks.findIndex(cc => c.height <= cc.height)
            : holdCellsToChecks.length;
        holdCellsToChecks.splice(insertIndex, 0, c);
    });
}

const result: string = grid.flat().reduce((sum, cell) => sum + cell.hold, 0).toString();

// console.log('volume');
console.log(result);
