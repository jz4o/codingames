/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const grid: string[][] = [];
for (let i = 0; i < N; i++) {
    const line: string = readline();

    grid.push(line.split(''));
}

const width: number = grid.map(row => row.length).reduce((max, length) => Math.max(max, length)) + 2;
grid.forEach(row => {
    row.push(...[...Array(width - row.length)].map(() => ' '));
});
grid.push([...Array(width)].map(() => ' '));
grid.push([...Array(width)].map(() => ' '));

[...Array(N + 2).keys()].reverse().forEach(rowIndex => {
    [...Array(width).keys()].reverse().forEach(columnIndex => {
        if (grid[rowIndex][columnIndex] !== ' ') {
            return;
        }

        if (rowIndex >= 2 && columnIndex >= 2 && grid[rowIndex - 2][columnIndex - 2] !== ' ') {
            grid[rowIndex][columnIndex] = '`';
        }

        if (rowIndex >= 1 && columnIndex >= 1 && grid[rowIndex - 1][columnIndex - 1] !== ' ') {
            grid[rowIndex][columnIndex] = '-';
        }
    });
});

grid.forEach(row => {
    console.log(row.join('').trimRight());
});
