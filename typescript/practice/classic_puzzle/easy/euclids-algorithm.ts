/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const a: number = parseInt(inputs[0]);
const b: number = parseInt(inputs[1]);

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

let tempA: number = a;
let tempB: number = b;

const results: string[] = [];
let r: number;
do {
    r = tempA % tempB;

    results.push(`${tempA}=${tempB}*${Math.floor(tempA / tempB)}+${r}`);
    tempA = tempB;
    tempB = r;
} while (r !== 0);
results.push(`GCD(${a},${b})=${tempA}`);

// console.log('GCD(a,b)');
results.forEach(result => {
    console.log(result);
});
