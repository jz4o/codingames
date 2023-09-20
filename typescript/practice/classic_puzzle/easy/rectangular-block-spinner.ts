/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const size: number = parseInt(readline());
const angle: number = parseInt(readline());
const grid: string[][] = [];
for (let i = 0; i < size; i++) {
    const line: string = readline();
    grid.push(line.split(' '))
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const transpose = array => array[0].map((_value, index) => array.map(row => row[index]));

const rangeArrayFromTo = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
}

const DIAGONAL_SIZE: number = size * 2 - 1;

const rotateCount: number = Math.trunc(((angle - 45) % 360) / 90);
const rotatedGrid: string[][] = Array(rotateCount).fill(null).reduce(rotatedGrid => {
    return transpose(rotatedGrid).reverse();
}, grid);

const diamondGrid: string[] = [];
rangeArrayFromTo(1, DIAGONAL_SIZE).forEach(time => {
    const start: number = Math.max(0, time - size);
    const width: number = Math.min(time, size * 2 - time);

    const diamondRow: string[] = [];

    rangeArrayFromTo(0, width - 1).forEach(s => {
        diamondRow.push(rotatedGrid[start + s].pop());
    });

    const spaceSize: number=  size - diamondRow.length;
    const space: string = ' '.repeat(spaceSize);

    diamondGrid.push(`${space}${diamondRow.join(' ')}${space}`);
});

// console.log('answer');
diamondGrid.forEach(diamondRow => {
    console.log(diamondRow);
});

