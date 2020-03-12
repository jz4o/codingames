/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const numbers: number[] = [...Array(n).keys()].map(i => i + 1);
const sum: number = numbers.reduce((sum, i) => sum + (Math.floor(n / i) * i), 0);

// console.log('sum');
console.log(sum);
