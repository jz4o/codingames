/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const M: number = parseInt(readline());
const N: number = parseInt(readline());
const grid: number[][] = [];
grid.push(Array(N + 1).fill(1))
for (let i = 0; i < M; i++) {
    const ROW: string = readline();

    grid.push([1, ...ROW.split('').map(i => parseInt(i))]);
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
}

const pathGrid: number[][] = [...Array(M + 1)].map(() => Array(N + 1).fill(0));
grid[1][1] = pathGrid[1][1] = 1;
rangeArrayFromTo(1, M).forEach(row => {
    rangeArrayFromTo(1, N).forEach(column => {
        if (grid[row][column] !== 0) {
            return;
        }

        const topMassPaths: number = pathGrid[row - 1][column];
        const leftMassPaths: number = pathGrid[row][column - 1];
        pathGrid[row][column] = topMassPaths + leftMassPaths;
    });
});

// console.log('answer');
console.log(pathGrid[M][N]);

