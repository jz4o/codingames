/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const input: string = readline();
// for (let i = 0; i < 4; i++) {
//
//     // Write an answer using console.log()
//     // To debug: console.error('Debug messages...');
//
//     console.log('answer');
// }

const transpose: <T>(array: T[][]) => T[][] = <T>(array: T[][]): T[][] => {
    return array[0].map((_value, index) => array.map(row => row[index]));
};

const digits: number[] = input.replace(/:/g, '').slice(1).split('').map(s => parseInt(s));
const fourBitDigits: string[] = digits.map(d => d.toString(2).padStart(4, '0'));
const transposedFourBitDigits: string[][] = transpose(fourBitDigits.map(bits => bits.split('')));

const results: string[] = transposedFourBitDigits.map(bits => {
    const replacedBits: string[] = bits.map(b => (b === '0' ? '_' : '#').repeat(5));

    return `|${replacedBits.join('|')}|`;
});

results.forEach(result => {
    console.log(result);
});
