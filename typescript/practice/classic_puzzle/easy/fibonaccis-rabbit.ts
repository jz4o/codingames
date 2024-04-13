/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs1: string[] = readline().split(' ');
const F0: number = parseInt(inputs1[0]);
const N: number = parseInt(inputs1[1]);
const inputs2: string[] = readline().split(' ');
const a: number = parseInt(inputs2[0]);
const b: number = parseInt(inputs2[1]);

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const tempArray: bigint[] = new Array(N).fill(BigInt(0));
tempArray.unshift(BigInt(F0));

rangeArrayFromTo(a, N).forEach(i => {
    const beginIndex: number = Math.max(i - b, 0);
    const endIndex: number = i - a;

    tempArray[i] = tempArray.slice(beginIndex, endIndex + 1).reduce((sum, elm) => sum + elm);
});

const result: string = tempArray[tempArray.length - 1].toString();

// console.log('Rabbits on time N.');
console.log(result);
