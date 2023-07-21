/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

var inputs: string[] = readline().split(' ');
const n: number = parseInt(inputs[0]);
const m: number = parseInt(inputs[1]);
var inputs: string[] = readline().split(' ');
const xs: number[] = [];
for (let i = 0; i < n; i++) {
    const x: number = parseInt(inputs[i]);
    xs.push(x);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const sortedXs: number[] = xs.sort((a, b) => a - b);

const diffs: number[] = [...Array(sortedXs.length - m + 1).keys()].map(i => sortedXs[i + m - 1] - sortedXs[i]);

const result: number = diffs.reduce((min, diff) => diff < min ? diff : min);

// console.log('answer');
console.log(result);
