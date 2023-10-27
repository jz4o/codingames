/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const line1: string = readline();
const line2: string = readline();
const line3: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const NUM_PARTS_ARRAY: string[] = [
    ' ||_ _ ||',
    '       ||',
    '  |___ | ',
    '   ___ ||',
    ' |  _  ||',
    ' | ___  |',
    ' ||___  |',
    '   _   ||',
    ' ||___ ||',
    ' | ___ ||'
];

const charGrid: string[][] = [...Array(line1.length).keys()].map(i => {
    return [line1[i], line2[i], line3[i]];
});

const results: number[] = rangeArrayFromTo(0, charGrid.length - 1, 3).map(index => {
    const targetNumParts: string = charGrid.slice(index, index + 3).flat().join('');

    return NUM_PARTS_ARRAY.indexOf(targetNumParts);
});

const result: string = results.join('');

// console.log('number');
console.log(result);
