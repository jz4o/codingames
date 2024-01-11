/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const binaryLength: number = n.toString(2).length;

const zeroIncludedN: number = n + 1;

const result: string = rangeArrayFromTo(1, binaryLength)
    .reduce((result, i) => {
        const binaryCycleLength: number = Math.pow(2, i);
        const zeroLengthInCycle: number = binaryCycleLength / 2;
        const oneLengthInCycle: number = binaryCycleLength / 2;

        const div: number = Math.floor(zeroIncludedN / binaryCycleLength);
        const mod: number = zeroIncludedN % binaryCycleLength;

        return result + (div * oneLengthInCycle) + Math.max(mod - zeroLengthInCycle, 0);
    }, 0)
    .toString();

// console.log('Number of 1s');
console.log(result);
