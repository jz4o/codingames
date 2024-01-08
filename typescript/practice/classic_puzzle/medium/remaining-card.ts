/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

let base: number = 2;
let step: number = 2;
let maxNum: number = N;
while (base < maxNum) {
    const prevMax: number = maxNum;
    maxNum = Math.floor((maxNum - base) / step) * step + base;

    if (prevMax === maxNum) {
        base += step;
    }

    step *= 2;
}

const result: string = maxNum.toString();

// console.log('answer');
console.log(result);
