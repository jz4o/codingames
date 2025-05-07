/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const BINGO_ROWS = 5;

const n: number = parseInt(readline());
const rows: string[] = [];
for (let i = 0; i < n * BINGO_ROWS; i++) {
    const row: string = readline();
    rows.push(row);
}
const calls: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const transpose: <T>(array: T[][]) => T[][] = <T>(array: T[][]): T[][] => {
    return array[0].map((_value, index) => array.map(row => row[index]));
};

const playerNumbers: string[][] = [];
const lines: string[][] = [];
rangeArrayFromTo(0, rows.length - 1, BINGO_ROWS).forEach(index => {
    const playerRows: string[] = rows.slice(index, index + BINGO_ROWS);
    const grid: string[][] = playerRows.map(playerRow => playerRow.split(' '));

    playerNumbers.push(Array.from(new Set(grid.flat())));

    lines.push(...grid.map(row => Array.from(new Set(row))));
    lines.push(...transpose(grid).map(row => Array.from(new Set(row))));
    lines.push([...Array(BINGO_ROWS).keys()].map(i => grid[i][i]));
    lines.push([...Array(BINGO_ROWS).keys()].map(i => grid[i][BINGO_ROWS - i - 1]));
});

playerNumbers.forEach(numbers => {
    const zeroIndex: number = numbers.indexOf('0');
    if (zeroIndex !== -1) {
        numbers.splice(zeroIndex, 1);
    }
});
lines.forEach(line => {
    const zeroIndex: number = line.indexOf('0');
    if (zeroIndex !== -1) {
        line.splice(zeroIndex, 1);
    }
});

const callNumbers: string[] = calls.split(' ');

let completeIndex: number;
let fullHouseIndex: number;
callNumbers.some((callNumber, index) => {
    lines.forEach(line => {
        const numberIndex: number = line.indexOf(callNumber);
        if (numberIndex !== -1) {
            line.splice(numberIndex, 1);
        }
    });
    if (completeIndex === undefined && lines.some(line => line.length === 0)) {
        completeIndex = index + 1;
    }

    playerNumbers.forEach(numbers => {
        const numberIndex: number = numbers.indexOf(callNumber);
        if (numberIndex !== -1) {
            numbers.splice(numberIndex, 1);
        }
    });
    if (fullHouseIndex === undefined && playerNumbers.some(numbers => numbers.length === 0)) {
        fullHouseIndex = index + 1;
        return true;
    }

    return false;
});

// console.log('answer');
console.log(completeIndex);
console.log(fullHouseIndex);
