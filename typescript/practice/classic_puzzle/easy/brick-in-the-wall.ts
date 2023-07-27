/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const X: number = parseInt(readline());
const N: number = parseInt(readline());
var inputs: string[] = readline().split(' ');
const ms: number[] = [];
for (let i = 0; i < N; i++) {
    const m: number = parseInt(inputs[i]);
    ms.push(m);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const w = (l: number, m: number): number => {
    return (l - 1) * 6.5 / 100 * 10 * m;
}

const rangeArrayFromTo = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
}

const sortedMs: number[] = ms.sort((a, b) => b - a);

const works: number[] = [...Array(Math.ceil(N / X)).keys()].flatMap(i => {
    const l: number = i + 1;

    const beginIndex: number = i * X;
    const endIndex = Math.min(beginIndex + X, sortedMs.length);

    return rangeArrayFromTo(beginIndex, endIndex - 1).map(j => w(l, sortedMs[j]));
});

const sum: number = works.reduce((sum, work) => sum + work);
const result: string = sum.toFixed(3);

// console.log('answer');
console.log(result);
