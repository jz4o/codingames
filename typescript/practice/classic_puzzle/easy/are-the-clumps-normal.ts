/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const digits: number[] = N.split('').map(c => parseInt(c));
const maxDigit: number = digits.reduce((max, digit) => Math.max(max, digit));

let chunkSize: number = 1;
let base: number = 1;
while (true) {
    base++;
    if (maxDigit < base) {
        break;
    }

    const tempChunk: number[] = [];
    digits.forEach(digit => {
        const mod: number = digit % base;
        if ((tempChunk.length === 0 ? -1 : tempChunk[tempChunk.length - 1]) !== mod) {
            tempChunk.push(mod);
        }
    });

    const tempChunkSize: number = tempChunk.length;
    if (tempChunkSize < chunkSize) {
        break;
    }

    chunkSize = tempChunkSize;
}

const result: string = maxDigit < base ? 'Normal' : base.toString();

// console.log('Normal');
console.log(result);
