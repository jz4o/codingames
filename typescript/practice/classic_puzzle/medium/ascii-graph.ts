/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const inputRows: [number, number][] = [];
for (let i = 0; i < N; i++) {
    const inputs: string[] = readline().split(' ');
    const x: number = parseInt(inputs[0]);
    const y: number = parseInt(inputs[1]);
    inputRows.push([x, y]);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Point = {
    x: number,
    y: number
};

const points: Point[] = inputRows.map(([x, y]) => { return { x, y }; });
const xs: number[] = points.map(point => point.x).concat(0);
const ys: number[] = points.map(point => point.y).concat(0);

const yPlusLength: number = Math.abs(Math.max(...ys)) + 1;
const yMinusLength: number = Math.abs(Math.min(...ys)) + 1;
const xPlusLength: number = Math.abs(Math.max(...xs)) + 1;
const xMinusLength: number = Math.abs(Math.min(...xs)) + 1;

const yLength: number = yPlusLength + yMinusLength + 1;
const xLength: number = xPlusLength + xMinusLength + 1;
const grid: string[][] = [...Array(yLength).keys()].map(() => Array(xLength).fill('.'));

const zeroPoint: Point = { x: xMinusLength, y: yPlusLength };

grid[zeroPoint.y] = Array(xLength).fill('-');
grid.forEach(row => {
    row[zeroPoint.x] = '|';
});
grid[zeroPoint.y][zeroPoint.x] = '+';

points.forEach(point => {
    grid[zeroPoint.y - point.y][zeroPoint.x + point.x] = '*';
});

const results: string[] = grid.map(row => row.join(''));

// console.log('answer');
results.forEach(result => {
    console.log(result);
});

