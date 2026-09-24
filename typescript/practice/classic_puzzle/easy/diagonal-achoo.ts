/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline(), 10);
const g: number = parseInt(readline(), 10);
const rowsArray: string[][] = [];
for (let i = 0; i < g; i++) {
    const rows: string[] = [];
    for (let j = 0; j < n; j++) {
        const row: string = readline();
        rows.push(row);
    }
    rowsArray.push(rows);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const NORMAL_PERSON: string = '.';
const HEALTHY_PERSON: string = 'H';
const CONTAGIOUS_PERSON: string = 'C';

interface Cell {
    y: number;
    x: number;
    v: string;
}

const grids: string[][][] = rowsArray.map(rows => {
    return rows.map(row => row.split(''));
});

const infectedGrids: Cell[][][] = grids.map(grid => {
    const surroundedGrid: string[][] = grid.map(row => [HEALTHY_PERSON, ...row, HEALTHY_PERSON]);
    surroundedGrid.unshift(Array(n + 2).fill(HEALTHY_PERSON));
    surroundedGrid.push(Array(n + 2).fill(HEALTHY_PERSON));

    const cellGrid: Cell[][] = surroundedGrid.map((row, rowIndex) => {
        return row.map((value, columnIndex) => {
            return { y: rowIndex, x: columnIndex, v: value };
        });
    });

    const cellsToCheck: Cell[] = cellGrid.flat().filter(cell => cell.v === CONTAGIOUS_PERSON);

    const checkedCells: Cell[] = [];
    while (cellsToCheck.length > 0) {
        const targetCell: Cell = cellsToCheck.pop();
        checkedCells.push(targetCell);

        const nextCheckCells: Cell[] = [
            cellGrid[targetCell.y - 1][targetCell.x - 1],
            cellGrid[targetCell.y - 1][targetCell.x + 1],
            cellGrid[targetCell.y + 1][targetCell.x - 1],
            cellGrid[targetCell.y + 1][targetCell.x + 1],
        ].filter(cell => cell.v === NORMAL_PERSON);

        nextCheckCells.forEach(cell => cell.v = CONTAGIOUS_PERSON);

        nextCheckCells.forEach(cell => {
            if (cellsToCheck.includes(cell) || checkedCells.includes(cell)) {
                return;
            }

            cellsToCheck.push(cell);
        });
    }

    return cellGrid.slice(1, -1).map(row => {
        return row.slice(1, -1);
    });
});

const infectedCounts: number[] = infectedGrids.map(grid => {
    return grid.flat().filter(cell => cell.v === CONTAGIOUS_PERSON).length;
});
const mostInfectedCount: number = Math.max(...infectedCounts);
const mostInfectedGridIndex: number = infectedCounts.indexOf(mostInfectedCount);
const mostInfectedGridValueRows: string[] = infectedGrids[mostInfectedGridIndex].map(row => {
    return row.map(cell => cell.v).join('');
});

const results: string[] = [
    mostInfectedGridIndex.toString(),
    ...mostInfectedGridValueRows,
];

// console.log('Index (starts from 0)');
// console.log('C.C.');
// console.log('.C.C');
// console.log('C.H.');
// console.log('.C..');
results.forEach(result => {
    console.log(result);
});
