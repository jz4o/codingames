/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline(), 10);
const S: number = parseInt(readline(), 10);
const Q: number = parseInt(readline(), 10);

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArray: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    if (step > 0 && from <= to) {
        return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
    } else if (step < 0 && from >= to) {
        return [...Array(Math.floor((from - to + Math.abs(step)) / Math.abs(step))).keys()].map(i => from + i * step);
    } else {
        return [];
    }
};

const diffSum: number = rangeArray(1, N).reduce((sum, i) => sum + i, 0) - S;
const diffSquare: number = rangeArray(1, N).reduce((sum, i) => sum + i**2) - Q;

const [minMissingNumber, maxMissingNumber]: number[] = rangeArray(1, Math.floor(diffSum / 2)).flatMap(i => {
    const j: number = diffSum - i;

    return i**2 + j**2 === diffSquare ? [i, j] : [];
});

const result: string = `${minMissingNumber} ${maxMissingNumber}`;

// console.log('answer');
console.log(result);
