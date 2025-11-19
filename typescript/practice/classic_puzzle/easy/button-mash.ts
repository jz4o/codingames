/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

let numbers: number[] = [1];
let count: number = 1;
while (!numbers.includes(n)) {
    numbers = [...new Set(numbers.flatMap(num => [num, num + 1, num - 1, num * 2]))];
    count++;
}

const result: string = count.toString();

// console.log('Good Luck!');
console.log(result);

