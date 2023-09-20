/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const _width: number = parseInt(inputs[0]);
const height: number = parseInt(inputs[1]);
const grid: string[][] = [];
for (let i = 0; i < height; i++) {
    const line: string = readline();

    grid.push(line.split(''));
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const transpose = array => array[0].map((_value, index) => array.map(row => row[index]));

const transposedGrid: string[][] = transpose(grid);
const transposedMovedGrid: string[][] = transposedGrid.map(line => line.sort().reverse());
const movedGrid: string[][] = transpose(transposedMovedGrid);

// console.log('answer');
movedGrid.forEach(line => {
    console.log(line.join(''));
});
