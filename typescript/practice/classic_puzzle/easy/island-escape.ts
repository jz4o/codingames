/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const elevationRows: number[][] = [];
for (let i = 0; i < N; i++) {
    const inputs: string[] = readline().split(' ');
    const elevationRow: number[] = [];
    for (let j = 0; j < N; j++) {
        const elevation: number = parseInt(inputs[j]);
        elevationRow.push(elevation);
    }
    elevationRows.push(elevationRow);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

interface Cell {
    y: number;
    x: number;
    v: number;
};

const OCEAN_VALUE: number = 0;

const isIncludeOceanCell: (cells: Cell[]) => boolean = (cells: Cell[]): boolean => {
    return cells.some(cell => cell.v === OCEAN_VALUE);
};

const grid: Cell[][] = elevationRows.map((elevationRow, rowIndex) => {
    return elevationRow.map((elevation, valueIndex) => {
        return { y: rowIndex, x: valueIndex, v: elevation };
    });
});

const centerIndex: number = Math.floor(N / 2);
const startCell: Cell = grid[centerIndex][centerIndex];

const reachableCells: Cell[] = [startCell];
const beCheckCells: Cell[] = [startCell];
while (beCheckCells.length > 0) {
    const checkCell: Cell = beCheckCells.pop();

    const aroundCells: Cell[] = [
        grid[checkCell.y - 1][checkCell.x],
        grid[checkCell.y][checkCell.x - 1],
        grid[checkCell.y][checkCell.x + 1],
        grid[checkCell.y + 1][checkCell.x]
    ].filter(cell => checkCell.v - 1 <= cell.v && cell.v <= checkCell.v + 1);

    const newCells: Cell[] = aroundCells.filter(cell => {
        return !reachableCells.includes(cell) && !beCheckCells.includes(cell);
    });

    reachableCells.push(...newCells.filter(cell => !reachableCells.includes(cell)));
    if (isIncludeOceanCell(newCells)) {
        break;
    }

    beCheckCells.push(...newCells.filter(cell => !beCheckCells.includes(cell)));
}

const result: string = isIncludeOceanCell(reachableCells) ? 'yes' : 'no';

// console.log('maybe');
console.log(result);
