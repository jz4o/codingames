/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline()); // the number of temperatures to analyse
const ts: number[] = [];
const inputs: string[] = readline().split(' ');
for (let i = 0; i < n; i++) {
    const t: number = parseInt(inputs[i]);// a temperature expressed as an integer ranging from -273 to 5526
    ts.push(t);
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

let closestZeroNegative: number;
let closestZeroPositive: number;
ts.forEach(function(t) {
    if ((closestZeroNegative || -273) <= t && t < 0) {
        closestZeroNegative = t;
    } else if (0 < t && t <= (closestZeroPositive || 5526)) {
        closestZeroPositive = t;
    } else if (t === 0) {
        closestZeroNegative = 0;
        closestZeroPositive = 0;
    }
});

const npBalance = (closestZeroNegative || 0) + (closestZeroPositive || 0)
let result: number;
if (n === 0) {
    result = 0;
} else if (closestZeroNegative === undefined || closestZeroPositive === undefined) {
    result = npBalance;
} else if (npBalance <= 0) {
    result = closestZeroPositive;
} else if (npBalance > 0) {
    result = closestZeroNegative;
}

// console.log('result');
console.log(result);

