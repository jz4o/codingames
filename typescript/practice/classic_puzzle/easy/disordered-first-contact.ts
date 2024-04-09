/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const MESSAGE: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
};

const decode = (text: string): string => {
    let result: string = '';
    let turn: number = 1;

    let sum: number = turn;
    while (sum < text.length) {
        turn++;
        sum += turn;
    }

    while (turn > 0) {
        const sliceSize: number = text.length - rangeArrayFromTo(1, turn - 1).reduce((sum, value) => sum += value, 0);

        if (turn % 2 === 1) {
            result = `${text.slice(-sliceSize)}${result}`;
            text = text.slice(0, -sliceSize);
        } else {
            result = `${text.slice(0, sliceSize)}${result}`;
            text = text.slice(sliceSize);
        }

        turn--;
    }

    return result;
};

const encode = (text: string): string => {
    let result: string = '';
    let turn: number = 1;

    let target: string = text.slice(0, turn);
    text = text.slice(turn);
    while (target.length !== 0) {
        if (turn % 2 === 1) {
            result += target;
        } else {
            result = `${target}${result}`;
        }

        turn++;

        target = text.slice(0, turn);
        text = text.slice(turn);
    }

    return result;
};

const decodeOrEncode = N > 0 ? decode : encode;
const result: string = rangeArrayFromTo(1, Math.abs(N)).reduce(result => {
    return decodeOrEncode(result);
}, MESSAGE);

// console.log('answer');
console.log(result);
