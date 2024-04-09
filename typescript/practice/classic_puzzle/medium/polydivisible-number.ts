/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const NUMBER: string = readline();
// for (let i = 0; i < nbanswer; i++) {
//
//     // Write an answer using console.log()
//     // To debug: console.error('Debug messages...');
//
//     console.log('value');
// }

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const toBigInt: (baseNumber: string, base: number) => bigint = (baseNumber: string, base: number): bigint => {
    return baseNumber
        .split('')
        .reverse()
        .reduce((sum, digit, index) => sum + BigInt(parseInt(digit, base)) * bigIntPow(base, index), BigInt(0));
};

const bigIntPow: (x: number, y: number) => bigint = (x: number, y: number): bigint => {
    const bigIntX: bigint = BigInt(x);
    return [...Array(y).keys()].reduce((result) => result * bigIntX, BigInt(1));
};

const MAX_BASE: number = 36;

const numbers: number[] = NUMBER.split(' ').map(n => parseInt(n));
const maxNumber: number = Math.max(...numbers);

const results: number[] = rangeArrayFromTo(maxNumber + 1, MAX_BASE).filter(base => {
    const baseNumber: string = numbers.map(n => n.toString(base)).join('');
    const decimalNumber: string = toBigInt(baseNumber, base).toString();

    const isPolydivisible: boolean = rangeArrayFromTo(1, decimalNumber.length).every(i => {
        return BigInt(decimalNumber.slice(0, i)) % BigInt(i) === BigInt(0);
    });

    return isPolydivisible;
});

results.forEach(result => {
    console.log(result);
});
