/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const A: number = parseInt(inputs[0]);
const B: number = parseInt(inputs[1]);

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const primeDivision: (num: number) => number[] = (num: number): number[] => {
    const result: number[] = [];

    let tempNum: number = num;
    while (tempNum % 2 === 0) {
        result.push(2);
        tempNum /= 2;
    }

    let i: number = 3;
    while (tempNum !== 1) {
        if (tempNum % i === 0) {
            result.push(i);
            tempNum /= i;
        } else {
            i += 2;
        }
    }

    return result;
};

const aPrimes: number[] = primeDivision(A);
const aPrimeDivisions: { [key: string]: number } = {};
aPrimes.forEach(aPrime => {
    const aPrimeStr: string = aPrime.toString();
    if (!(aPrimeStr in aPrimeDivisions)) {
        aPrimeDivisions[aPrimeStr] = 0;
    }

    aPrimeDivisions[aPrimeStr]++;
});

const xs: number[] = Object.entries(aPrimeDivisions).map(([primeStr, count]) => {
    const prime: number = parseInt(primeStr);

    let exp: number = 1;
    while ((prime ** exp) <= B) {
        exp++;
    }
    const maxExp: number = exp - 1;

    const countPrimeInBFactorial: number = rangeArrayFromTo(1, maxExp)
        .reduce((sum, e) => sum + Math.floor(B / (prime ** e)), 0);

    return Math.floor(countPrimeInBFactorial / count);
});

const result: string = Math.min(...xs).toString();

// console.log('answer');
console.log(result);

