/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const typedKeys: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const beforeChars: string[] = [];
const afterChars: string[] = [];

typedKeys.split('').forEach(char => {
    if (char === '<') {
        if (beforeChars.length === 0) {
            return;
        }

        afterChars.unshift(beforeChars.pop());
    } else if (char === '>') {
        if (afterChars.length === 0) {
            return;
        }

        beforeChars.push(afterChars.shift());
    } else if (char === '-') {
        beforeChars.pop();
    } else {
        beforeChars.push(char);
    }
});

const result: string = beforeChars.concat(afterChars).join('');

// console.log('computed text');
console.log(result);
