/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const steps: number = parseInt(readline());
const h: number = parseInt(readline());
const w: number = parseInt(readline());
const rows: string[] = [];
for (let i = 0; i < h; i++) {
    const row: string = readline();
    rows.push(row);
}
// for (let i = 0; i < h; i++) {

//     // Write an answer using console.log()
//     // To debug: console.error('Debug messages...');

//     console.log('decrypted row');
// }

const transpose = <T>(array: T[][]): T[][] => array[0].map((_value, index) => array.map(row => row[index]));
const sum = (array: number[]): number => array.reduce((sum, elm) => sum + elm);

let grid: number[][] = rows.map(row => row.split('').map(c => c.charCodeAt(0)));
[...Array(steps).keys()].forEach(() => {
    // move to down
    grid = transpose(grid);
    grid = grid.map(row => {
        const moveCount: number = sum(row) % h;
        return row.slice(-moveCount).concat(row.slice(0, -moveCount));
    });
    grid = transpose(grid);

    // move to right
    grid = grid.map(row => {
        const moveCount: number = sum(row) % w;
        return row.slice(-moveCount).concat(row.slice(0, -moveCount));
    });
});

const results: string[] = grid.map(row => String.fromCharCode(...row));

results.forEach(result => {
    console.log(result);
});
