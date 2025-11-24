/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const pattern: string = readline();
const rows: string[] = [];
for (let i = 0; i < N; i++) {
    const row: string = readline();
    rows.push(row);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const patternSize: number = pattern.length;
const nSizePattern: string = pattern.repeat(N);
const doubleSizePattern: string = pattern.repeat(2);

const result: string = rows.map((row, rowIndex) => {
    if (nSizePattern.includes(row)) {
        return null;
    }

    const columnIndex: number = rangeArrayFromTo(0, N - 1)
        .reverse()
        .find(i => !doubleSizePattern.includes(row.slice(i, i + patternSize)));

    return `(${columnIndex},${rowIndex})`;
}).find(coordinate => coordinate !== null);

// console.log('(x,y)');
console.log(result);
