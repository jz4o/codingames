/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo: Function = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
}

const gcd: Function = (a: number, b: number): number => {
    const min: number = Math.min(a, b);
    const max: number = Math.max(a, b);

    return min === 0 ? max : gcd(min, max % min);
};

const lcm: Function = (a: number, b: number): number => {
    return a / gcd(a, b) * b;
};

const results: string[] = [];
rangeArrayFromTo(n + 1, n * 2).forEach(y => {
    const lcmNum: number = lcm(n, y);

    const nNumerator: number = lcmNum / n;
    const yNumerator: number = lcmNum / y;
    const xNumerator: number = nNumerator - yNumerator;

    if (xNumerator === 0 || lcmNum % xNumerator !== 0) {
        return;
    }

    const x: number = lcmNum / xNumerator;

    results.push(`1/${n} = 1/${x} + 1/${y}`);
});

// console.log('1/n = 1/x + 1/y');
results.forEach(result => {
    console.log(result);
});
