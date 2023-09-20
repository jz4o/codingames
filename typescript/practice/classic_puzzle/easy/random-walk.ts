/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const a: number = parseInt(readline());
const b: number = parseInt(readline());
const m: number = parseInt(readline());

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const [UP, DOWN, LEFT, RIGHT]: number[] = [...Array(4).keys()];

// D[0] = 0
let d: number = 0;

let u: number = 0;
let r: number = 0;
let step: number = 0;
do {
    step++;

    d = (a * d + b) % m;

    const direction: number = d % 4;
    if (direction === UP) {
        u++;
    } else if (direction === DOWN) {
        u--;
    } else if (direction === LEFT) {
        r--;
    } else if (direction === RIGHT) {
        r++;
    }
} while (u !== 0 || r !== 0);

const result: string = step.toString();

// console.log('result');
console.log(result);
