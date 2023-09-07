/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const framePattern: string = readline(); // the ASCII art pattern to use to frame the picture
var inputs: string[] = readline().split(' ');
const h: number = parseInt(inputs[0]); // the height of the picture
const w: number = parseInt(inputs[1]); // the width  of the picture
const lines: string[] = [];
for (let i = 0; i < h; i++) {
    const line: string = readline(); // the ASCII art picture line by line
    lines.push(line);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const surround: Function = (grid: string[][], frameChar: string): string[][] => {
    [...Array(grid.length).keys()].forEach(i => {
        grid[i].unshift(frameChar);
        grid[i].push(frameChar);
    });
    grid.unshift(Array(grid[0].length).fill(frameChar));
    grid.push(Array(grid[0].length).fill(frameChar));

    return grid;
};

const grid: string[][] = lines.map(line => line.padEnd(w).split(''));
const frameGrid: string[][] = `${framePattern} `.split('').reverse().reduce((grid, frameChar) => surround(grid, frameChar), grid);

const results: string[] = frameGrid.map(row => row.join(''));

// console.log('Write framed picture line by line here');
results.forEach(result => {
    console.log(result);
});
