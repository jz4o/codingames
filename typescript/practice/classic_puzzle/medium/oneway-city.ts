/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const M: number = parseInt(readline());
const N: number = parseInt(readline());

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo = (from: number, to: number): bigint[] => {
    return [...Array(to - from + 1).keys()].map(i => BigInt(i + from));
};

const minDistance: number = Math.min(M - 1, N - 1);
const maxDistance: number = Math.max(M - 1, N - 1);

const moleCombination: bigint = rangeArrayFromTo(maxDistance + 1, minDistance + maxDistance).reduce((mul, distance) => mul * distance, BigInt(1));
const denoCombination: bigint = rangeArrayFromTo(1, minDistance).reduce((mul, distance) => mul * distance, BigInt(1));

const movableCombination: bigint = moleCombination / denoCombination;
const significantDigits: string = movableCombination.toString().substring(0, 1000);

// console.log('answer');
console.log(significantDigits);
