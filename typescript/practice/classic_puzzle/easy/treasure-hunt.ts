/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const H: number = parseInt(inputs[0]);
const W: number = parseInt(inputs[1]);
const rows: string[] = [];
for (let i = 0; i < H; i++) {
    const row: string = readline();
    rows.push(row);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Position = {
    y: number,
    x: number,
    value: string
};

const YOUR_POSITION: string = 'X';
const WALL: string = '#';

rows.unshift(WALL.repeat(W));
rows.push(WALL.repeat(W));

const grid: Position[][] = rows
    .map(row => `${WALL}${row}${WALL}`)
    .map((row, rowIndex) => {
        return row.split('').map((value, columnIndex) => {
            return { y: rowIndex, x: columnIndex, value: value };
        });
    });

const startPosition: Position = grid.flat().find(position => position.value === YOUR_POSITION);

const moveHistories: Position[][] = [];
const tempHistories: Position[][] = [[startPosition]];
while (tempHistories.length > 0) {
    const tempHistory: Position[] = tempHistories.pop();
    const lastPosition: Position = tempHistory[tempHistory.length - 1];

    const aroundPositions: Position[] = [
        grid[lastPosition.y - 1][lastPosition.x],
        grid[lastPosition.y][lastPosition.x + 1],
        grid[lastPosition.y + 1][lastPosition.x],
        grid[lastPosition.y][lastPosition.x - 1]
    ];

    const aroundMovablePositions: Position[] = aroundPositions.filter(position => {
        return !tempHistory.includes(position) && position.value !== WALL;
    });

    if (aroundMovablePositions.length === 0) {
        moveHistories.push(tempHistory);
        continue;
    }

    aroundMovablePositions.forEach(position => {
        tempHistories.push(tempHistory.concat(position));
    });
}

const amountOfGolds: number[] = moveHistories.map(moveHistory => {
    return moveHistory
        .filter(position => "0123456789".includes(position.value))
        .map(position => parseInt(position.value))
        .reduce((sum, value) => sum + value, 0);
});

const result: number = amountOfGolds.reduce((max, amountOfGold) => Math.max(max, amountOfGold));

// console.log('answer');
console.log(result);
