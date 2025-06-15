/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const rows: string[] = [];
for (let i = 0; i < 8; i++) {
    const row: string = readline();
    rows.push(row);
}
const [colour, move]: string[] = readline().split(' ');

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Position = {
    y: number,
    x: number,
    value: string
};

const WALL: string = '#';
const WHITE: string = 'W';
const BLACK: string = 'B';
const EMPTY: string = '-';

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const reverseStones: (linePositions: Position[], moveValue: string) => void = (linePositions: Position[], moveValue: string): void => {
    const sameColorIndexes: number[] = linePositions.map((position, index) => position.value === moveValue ? index : null).filter(index => index !== null);
    if (sameColorIndexes.length === 0) {
        return;
    }
    const [nearestSameColorIndex]: number[] = sameColorIndexes;

    const reversedValue: string = moveValue === WHITE ? BLACK : WHITE;

    const reverseTargetPositions: Position[] = linePositions.slice(0, nearestSameColorIndex);
    if (reverseTargetPositions.some(position => position.value !== reversedValue)) {
        return;
    }

    reverseTargetPositions.forEach(position => {
        position.value = moveValue;
    });
};

const moveStone: (grid: Position[][], movePosition: Position) => void = (grid: Position[][], movePosition: Position): void => {
    const gridHeight: number = grid.length;
    const gridWidth: number = grid[0].length;

    grid[movePosition.y][movePosition.x] = movePosition;

    // top
    const topPositions: Position[] = [...Array(movePosition.y).keys()].map(i => grid[i][movePosition.x]).reverse();
    reverseStones(topPositions, movePosition.value);

    // top-right
    const topRightLength: number = Math.min(movePosition.y, gridWidth - movePosition.x - 1);
    const topRightPositions: Position[] = rangeArrayFromTo(1, topRightLength).map(i => grid[movePosition.y - i][movePosition.x + i]);
    reverseStones(topRightPositions, movePosition.value);

    // right
    const rightPositions: Position[] = grid[movePosition.y].slice(movePosition.x + 1);
    reverseStones(rightPositions, movePosition.value);

    // bottom-right
    const bottomRightLength: number = Math.min(gridHeight - movePosition.y - 1, gridWidth - movePosition.x - 1);
    const bottomRightPositions: Position[] = rangeArrayFromTo(1, bottomRightLength).map(i => grid[movePosition.y + i][movePosition.x + i]);
    reverseStones(bottomRightPositions, movePosition.value);

    // bottom
    const bottomPositions: Position[] = rangeArrayFromTo(movePosition.y + 1, gridHeight - 1).map(i => grid[i][movePosition.x]);
    reverseStones(bottomPositions, movePosition.value);

    // bottom-left
    const bottomLeftLength: number = Math.min(gridHeight - movePosition.y - 1, movePosition.x);
    const bottomLeftPositions: Position[] = rangeArrayFromTo(1, bottomLeftLength).map(i => grid[movePosition.y + i][movePosition.x - i]);
    reverseStones(bottomLeftPositions, movePosition.value);

    // left
    const leftPositions: Position[] = grid[movePosition.y].slice(0, movePosition.x).reverse();
    reverseStones(leftPositions, movePosition.value);

    // top-left
    const topLeftLength: number = Math.min(movePosition.y, movePosition.x);
    const topLeftPositions: Position[] = rangeArrayFromTo(1, topLeftLength).map(i => grid[movePosition.y - i][movePosition.x - i]);
    reverseStones(topLeftPositions, movePosition.value);
};

const strGrid: string[][] = [
    Array(10).fill(WALL),
    ...rows.map(row => [WALL, ...row, WALL]),
    Array(10).fill(WALL)
];
const grid: Position[][] = strGrid.map((row, rowIndex) => {
    return row.map((value, columnIndex) => {
        return { y: rowIndex, x: columnIndex, value };
    });
});

const [moveColumnStr, moveRowStr]: string[] = move.split('');
const moveColumn: number = 'abcdefgh'.indexOf(moveColumnStr) + 1;
const moveRow: number = parseInt(moveRowStr);

const movePosition: Position = { y: moveRow, x: moveColumn, value: colour };

let result: string;
if (grid[moveRow][moveColumn].value === EMPTY) {
    const beforeWhiteCount: number = grid.flat().filter(position => position.value === WHITE).length;
    const beforeBlackCount: number = grid.flat().filter(position => position.value === BLACK).length;

    moveStone(grid, movePosition);

    const afterWhiteCount: number = grid.flat().filter(position => position.value === WHITE).length;
    const afterBlackCount: number = grid.flat().filter(position => position.value === BLACK).length;

    const isLegalMove: boolean = beforeWhiteCount !== afterWhiteCount && beforeBlackCount !== afterBlackCount;
    result = isLegalMove ? `${afterWhiteCount} ${afterBlackCount}` : 'NULL';
} else {
    result = 'NOPE';
}

// console.log('answer');
console.log(result);

