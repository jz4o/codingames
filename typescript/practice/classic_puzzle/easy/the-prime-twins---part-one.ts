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

const isPrime: (num: number) => boolean = (num: number): boolean => {
    return num % 2 !== 0 && rangeArrayFromTo(3, num - 1, 2).every(i => num % i !== 0);
};

const getNextPrime: (n: number) => number = (n: number): number => {
    if (n < 2) {
        return 2;
    }

    let tempN: number = n % 2 === 0 ? n + 1 : n + 2;
    while (!isPrime(tempN)) {
        tempN += 2;
    }

    return tempN;
};

let left: number = getNextPrime(n);
let right: number;
while ((right = getNextPrime(left)) !== left + 2) {
    left = right;
}

const result: string = `${left} ${right}`;

// console.log('answer');
console.log(result);
