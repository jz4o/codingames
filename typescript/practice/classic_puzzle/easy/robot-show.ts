/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const L: number = parseInt(readline());
const N: number = parseInt(readline());
const inputs: string[] = readline().split(' ');
const bs: number[] = [];
for (let i = 0; i < N; i++) {
    const b: number = parseInt(inputs[i]);
    bs.push(b);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const minB: number = Math.min(...bs);
const maxB: number = Math.max(...bs);

const result: string = Math.max(L - minB, maxB).toString();

// console.log('answer');
console.log(result);
