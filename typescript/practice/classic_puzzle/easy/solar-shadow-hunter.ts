/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const _W: number = parseInt(inputs[0], 10);
const H: number = parseInt(inputs[1], 10);
const K: number = parseInt(readline(), 10);
const rows: string[] = [];
for (let i = 0; i < H; i++) {
    const row: string = readline();
    rows.push(row);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const grid: string[][] = rows.map(row => row.split(''));

grid.forEach((row, rowIndex) => {
    row.forEach((value, columnIndex) => {
        if (!"0123456789".includes(value)) {
            return;
        }

        const shadowLength = Math.min(parseInt(value, 10) * K, rowIndex);
        [...Array(shadowLength).keys()].forEach(shadowIndex => {
            const distance = shadowIndex + 1;
            grid[rowIndex - distance][columnIndex] = '.';
        });
    });
});

const panelCount: number = grid.flat().filter(value => value === 'P').length;

const result: string = (panelCount * 100).toString();

// console.log('result');
console.log(result);
