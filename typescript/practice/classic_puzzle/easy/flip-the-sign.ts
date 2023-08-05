/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

var inputs: string[] = readline().split(' ');
const height: number = parseInt(inputs[0]);
const width: number = parseInt(inputs[1]);
const lines1: string[] = [];
for (let i = 0; i < height; i++) {
    const line: string = readline();
    lines1.push(line);
}
const lines2: string[] = [];
for (let i = 0; i < height; i++) {
    const line: string = readline();
    lines2.push(line);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const lines1Numbers: number[] = lines1.join(' ').split(' ').map(i => parseInt(i));
const lines2Marks: string[] = lines2.join(' ').split(' ');

const xNumbers: number[] = [...Array(lines1Numbers.length).keys()].filter(i => lines2Marks[i] === 'X').map(i => lines1Numbers[i]);
const xPositiveBooleans: boolean[] = xNumbers.map(number => number > 0);

const result: string = [...Array(Math.max(xPositiveBooleans.length - 1, 0)).keys()].every(i => xPositiveBooleans[i] !== xPositiveBooleans[i + 1]).toString();

// console.log('true/false');
console.log(result);
