/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const a: string = readline();
const b: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const aVectors: number[] = a.split(' ').map(i => parseInt(i));
const bVectors: number[] = b.split(' ').map(i => parseInt(i));

let result: number = 0;
while (aVectors.length > 0) {
    const [aLength, aValue]: number[] = aVectors.splice(0, 2);
    const [bLength, bValue]: number[] = bVectors.splice(0, 2);

    const length: number = Math.min(aLength, bLength);
    const value: number = aValue * bValue;

    result += value * length;

    if (length < aLength) {
        aVectors.unshift(aLength - length, aValue);
    } else if (length < bLength) {
        bVectors.unshift(bLength - length, bValue);
    }
}

// console.log('a DOT b');
console.log(result);
