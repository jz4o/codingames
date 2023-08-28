/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const digits: number[] = (parseInt(n) + 1).toString().split('').map(c => parseInt(c));

const incrementIndex: number = [...Array(digits.length - 1).keys()].find(index => digits[index] > digits[index + 1]);
const incrementNumber: number = digits[incrementIndex];

digits.fill(incrementNumber, incrementIndex + 1);

const result: string = digits.join('');

// console.log('answer');
console.log(result);
