/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const h: number = parseInt(readline());
const w: number = parseInt(readline());
const rows: string[] = [];
for (let i = 0; i < h; i++) {
    const row: string = readline();
    rows.push(row);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

interface Position {
    y: number;
    x: number;
    value: string;
    isPassed: boolean | null;
}

const WALL: string = '#';
const EMPTY: string = '+';

const LEFT_COLUMN_INDEX: number = 1;
const RIGHT_COLUMN_INDEX: number = w;

const valueGrid: string[][] = rows.map(row => [WALL, ...row.split(' '), WALL]);
valueGrid.unshift(Array(w + 2).fill(WALL));
valueGrid.push(Array(w + 2).fill(WALL));

const grid: Position[][] = valueGrid.map((valueRow, rowIndex) => {
    return valueRow.map((value, columnIndex) => {
        let isPassed: boolean | null = null;
        if (value === EMPTY && columnIndex === RIGHT_COLUMN_INDEX) {
            isPassed = true;
        } else if (value === WALL) {
            isPassed = false;
        }

        return { y: rowIndex, x: columnIndex, value, isPassed };
    });
});

grid.forEach(row => {
    const leftPosition: Position = row[LEFT_COLUMN_INDEX];
    if (leftPosition.isPassed !== null) {
        return;
    }

    const positions: Position[] = [];
    const checkedPositions: Position[] = [];
    const beCheckPositions: Position[] = [leftPosition];
    while (beCheckPositions.length > 0) {
        const checkPosition: Position = beCheckPositions.pop();

        positions.push(checkPosition);

        const aroundEmptyPositions: Position[] = [
            grid[checkPosition.y - 1][checkPosition.x],
            grid[checkPosition.y][checkPosition.x - 1],
            grid[checkPosition.y][checkPosition.x + 1],
            grid[checkPosition.y + 1][checkPosition.x],
        ].filter(position => position.value === EMPTY);

        beCheckPositions.push(...aroundEmptyPositions.filter(position => !checkedPositions.includes(position)));
        checkedPositions.push(...aroundEmptyPositions);
    }

    if (positions.some(position => position.isPassed)) {
        positions.forEach(position => position.isPassed = true);
    }
});

const result: string = grid.filter(row => row[LEFT_COLUMN_INDEX].isPassed).length.toString();

// console.log('count');
console.log(result);
