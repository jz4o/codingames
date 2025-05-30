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
    let loopSize: number = 1;
    let sumLoopNumber: number = 1;
    while (sumLoopNumber < text.length) {
        loopSize++;
        sumLoopNumber += loopSize;
    }

    let tempText: string = text;
    return [...Array(loopSize).keys()].reverse().map(turn => {
        const sliceSize: number = tempText.length - rangeArrayFromTo(1, turn).reduce((sum, value) => sum + value, 0);

        if ((turn + 1) % 2 === 1) {
            const turnResult = tempText.slice(-sliceSize);
            tempText = tempText.slice(0, -sliceSize);

            return turnResult;
        } else {
            const turnResult = tempText.slice(0, sliceSize);
            tempText = tempText.slice(sliceSize);

            return turnResult;
        }
    }).reverse().join('');
};

const encode = (text: string): string => {
    let tempText: string = text;
    let turn: number = 1;
    const resultElements: string[] = [];
    while (tempText.length > 0) {
        const target: string = tempText.slice(0, turn);
        if (turn % 2 === 1) {
            resultElements.push(target);
        } else {
            resultElements.unshift(target);
        }

        tempText = tempText.slice(turn);

        turn++;
    }

    return resultElements.join('');
};

const decodeOrEncode = N > 0 ? decode : encode;
const result: string = rangeArrayFromTo(1, Math.abs(N)).reduce(result => {
    return decodeOrEncode(result);
}, MESSAGE);

// console.log('answer');
console.log(result);

