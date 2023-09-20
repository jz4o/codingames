/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const inputs: string[] = readline().split(' ');
const xs: number[] = [];
for (let i = 0; i < n; i++) {
    const x: number = parseInt(inputs[i]);

    xs.push(x);
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

let lIndex: number = -1;
let rIndex: number = xs.length;
let turn: number = 0;
while (lIndex < rIndex) {
    lIndex++;
    while(lIndex < xs.length && xs[lIndex] !== 0) {
        lIndex++;
    }

    rIndex--;
    while(rIndex >= 0 && xs[rIndex] !== 1) {
        rIndex--;
    }

    turn++;
}

// console.log('answer');
console.log(turn - 1);

