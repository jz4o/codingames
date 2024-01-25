/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

let result: number = 0;
let sideLength: number = n;
while (sideLength > 0) {
    const base: number = Math.pow(n, 2) - Math.pow(sideLength, 2) + 1;

    result += sideLength <= 1 ? base : [...Array(4).keys()].reduce((sum, i) => sum + (i * (sideLength - 1) + base), 0);

    sideLength -= 2;
}

// console.log('answer');
console.log(result);
