/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const line: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

let stack: number = 0;
let prefixSize: number = 0;
line.split('').some((c, step) => {
    stack += c === '<' ? 1 : -1;

    if (stack === 0) {
        prefixSize = step + 1;
    }

    if (stack < 0) {
        return true;
    }
});

const result: number = prefixSize;

// console.log('answer');
console.log(result);
