/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const ENCRYPT: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const sliceN = <T>(array: T[], sliceSize: number): T[][] => {
    const result: T[][] = [];

    let startIndex = 0;
    while (startIndex < array.length) {
        result.push(array.slice(startIndex, startIndex + sliceSize));
        startIndex += sliceSize;
    }

    return result;
};

let binaries: string = '';
const validFlag = sliceN(ENCRYPT.split(' '), 2).every(array => {
    const binary: string = array[0];
    const count: number = (array[1] || '').length;

    if (!['0', '00'].includes(binary) || count === 0) {
        return false;
    }

    binaries += (binary === '0' ? '1' : '0').repeat(count);

    return true;
});

// console.log('INVALID');
if (validFlag && binaries.length % 7 === 0) {
    const codePoints: number[] = sliceN(binaries.split(''), 7).map(slicedBinary => {
        return parseInt(slicedBinary.join(''), 2);
    });

    console.log(String.fromCodePoint(...codePoints));
} else {
    console.log('INVALID');
}

