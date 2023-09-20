/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const equality: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
}

const NUMERALS: string[] = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');

const [x, y, z]: string[] = equality.split(/[+=]/);

const minimumBase: number = equality.split('')
                                    .map(n => NUMERALS.indexOf(n))
                                    .reduce((maxIndex, index) => Math.max(maxIndex, index))
                                    + 1;

const result: number = rangeArrayFromTo(minimumBase, NUMERALS.length).find(base => {
    return parseInt(x, base) + parseInt(y, base) === parseInt(z, base);
});

// console.log('answer');
console.log(result);
