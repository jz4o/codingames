/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
var inputs: string[] = readline().split(' ');
const vs: number[] = [];
for (let i = 0; i < n; i++) {
    const v: number = parseInt(inputs[i]);

    vs.push(v);
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

let maxDiff: number = 0;
let minValue: number;
for (const v of vs.reverse()) {
    if (minValue === undefined || v < minValue) {
        minValue = v;
    }

    // diff is zero or minus
    const diff: number = minValue - v;
    if (diff < maxDiff) {
        maxDiff = diff;
    }
}

// console.log('answer');
console.log(maxDiff);
