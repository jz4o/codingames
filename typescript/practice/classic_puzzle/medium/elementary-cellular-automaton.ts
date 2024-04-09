/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const R: number = parseInt(readline());
const N: number = parseInt(readline());
const startPattern: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
};

const repeatStr = (str: string, count: number): string => {
    return Array(count + 1).join(str);
};

const zeroPadLeft = (str: string, length: number): string => {
    return `${repeatStr('0', length)}${str}`.substr(length * -1);
};

const RULE_LENGTH: number = 8;

const binaryDigitsR: string[] = zeroPadLeft(R.toString(2), RULE_LENGTH).split('').reverse();

const RULE: {[key: string]: string} = {};
rangeArrayFromTo(0, RULE_LENGTH - 1).forEach(i => {
    RULE[zeroPadLeft(i.toString(2), 3)] = binaryDigitsR[i];
});

const results: string[] = [];
rangeArrayFromTo(1, N).reduce(temp => {
    results.push(temp.replace(/0/g, '.').replace(/1/g, '@'));

    const result: string[] = [];
    [temp.slice(-1), ...temp.split(''), temp.slice(0, 1)].forEach((i, index, array) => {
        if (index >= temp.length) {
            return;
        }

        result.push(RULE[array.slice(index, index + 3).join('')]);
    });

    return result.join('');
}, startPattern.replace(/\./g, '0').replace(/@/g, '1'));

// console.log('.....@.@.....');
results.forEach(result => {
    console.log(result);
});
