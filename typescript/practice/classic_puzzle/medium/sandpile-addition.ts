/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const grid: number[][] = [];
for (let i = 0; i < n; i++) {
    const row: string = readline();

    grid.push(row.split('').map(v => parseInt(v)));
}
for (let i = 0; i < n; i++) {
    const row: string = readline();

    row.split('').forEach((v, c) => grid[i][c] += parseInt(v));
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const BORDER: number = 4;
while (grid.some(row => row.some(value => value >= BORDER))) {
    grid.forEach((row, rowIndex) => {
        row.forEach((value, columnIndex) => {
            if (value < BORDER) {
                return;
            }

            grid[rowIndex][columnIndex] -= BORDER;
            if (rowIndex > 0)          grid[rowIndex - 1][columnIndex]++; // above
            if (rowIndex + 1 !== n)    grid[rowIndex + 1][columnIndex]++; // below
            if (columnIndex > 0)       grid[rowIndex][columnIndex - 1]++; // left
            if (columnIndex + 1 !== n) grid[rowIndex][columnIndex + 1]++; // right
        });
    });
}

// console.log('answer');
grid.forEach(row => {
    console.log(row.join(''));
});
