/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
var inputs: string[] = readline().split(' ');
let xs: number[] = [];
for (let i = 0; i < N; i++) {
    const x: number = parseInt(inputs[i]);
    xs.push(x);
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

let totalCost: number = 0
while (xs.length >= 2) {
    xs.sort((a: number, b: number): number => a - b);

    const cost: number = xs.shift() + xs.shift();
    totalCost += cost;
    xs.push(cost);
}

// console.log('0');
console.log(totalCost);

