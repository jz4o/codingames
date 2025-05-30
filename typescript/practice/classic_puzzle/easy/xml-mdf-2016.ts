/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const sequence: string = readline();

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const depths: {[key: string]: number[]} = {};
let depth: number = 0;
const sequenceChars: string[] = sequence.split('');
while (sequenceChars.length > 0) {
    let char: string = sequenceChars.shift();

    if (char === '-') {
        char = sequenceChars.shift();

        depths[char] ||= [];
        depths[char].push(depth);

        depth--;
    } else {
        depth++;
    }
}

let maximumValueKey: string;
let maximumValue: number = 0;
Object.keys(depths).forEach(key => {
    const sum: number = depths[key].reduce((sum, keyDepth) => sum + 1 / keyDepth, 0);
    if (maximumValue < sum) {
        maximumValueKey = key;
        maximumValue = sum;
    }
});

// console.log('answer');
console.log(maximumValueKey);

