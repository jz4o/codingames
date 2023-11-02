/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const wife: string = readline();
const husband: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const gcd: (a: number, b: number) => number = (a: number, b: number): number => {
    const min: number = Math.min(a, b);
    const max: number = Math.max(a, b);

    return min === 0 ? max : gcd(min, max % min);
};

const lcm: (a: number, b: number) => number = (a: number, b: number): number => {
    return a / gcd(a, b) * b;
};

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const transpose: <T>(array: T[][]) => T[][] = <T>(array: T[][]): T[][] => {
    const rowSize: number = array.length;
    const columnSize: number = array[0].length;

    const result: T[][] = [];
    rangeArrayFromTo(0, columnSize - 1).forEach(columnIndex => {
        const transposedRow: T[] = [];
        rangeArrayFromTo(0, rowSize - 1).forEach(rowIndex => {
            transposedRow.push(array[rowIndex][columnIndex]);
        });
        result.push(transposedRow);
    });

    return result;
};


const frameSize: number = lcm(wife.length, husband.length);

const wifeLineChars: string[] = wife.repeat(frameSize / wife.length).split('');
const husbandLineChars: string[] = husband.repeat(frameSize / husband.length).split('');

let frameGrid: string[][] = [...Array(frameSize + 2).keys()].map(() => Array(frameSize).fill(' '));

frameGrid[0] = wifeLineChars;
frameGrid[frameGrid.length - 1] = husbandLineChars;

frameGrid = transpose(frameGrid);
frameGrid[0].splice(1, husbandLineChars.length, ...husbandLineChars);
frameGrid[frameGrid.length - 1].splice(1, wifeLineChars.length, ...wifeLineChars);
frameGrid = transpose(frameGrid);

const results: string[] = frameGrid.map(frameRow => frameRow.join(''));

// console.log('The Picture Frame');
results.forEach(result => {
    console.log(result);
});
