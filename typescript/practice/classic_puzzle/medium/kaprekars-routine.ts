/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n1: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const repeatStr = (str: string, count: number): string => {
    return Array(count + 1).join(str);
};

const zeroPadLeft = (str: string, length: number): string => {
    return `${repeatStr('0', length)}${str}`.substr(length * -1);
};

const DIGITS_SIZE: number = n1.length;
const answers: string[] = [];

let temp: string = n1;

while (!answers.includes(temp)) {
    answers.push(temp);

    const biggest: number = parseInt(temp.split('').sort().reverse().join(''));
    const smallest: number = parseInt(temp.split('').sort().join(''));
    const answer: number = biggest - smallest;

    temp = zeroPadLeft(`${answer}`, DIGITS_SIZE);
}

// console.log('1 2 3 4');
const result: string = answers.slice(answers.indexOf(temp)).join(' ');
console.log(result);
