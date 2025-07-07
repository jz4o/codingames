/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const message1: string = readline();
const message2: string = readline();
const message3: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const zip: (...arrays: any[][]) => any[][] = (...arrays: any[][]): any[][] => {
    const arraySize: number = Math.max(...arrays.map(array => array.length));
    return [...Array(arraySize).keys()].map(index => {
        return arrays.map(array => array[index]);
    });
};

const message1BinaryChars: number[] = message1.match(/.{2}/g).map(hexDecimalChar => parseInt(hexDecimalChar, 16));
const message2BinaryChars: number[] = message2.match(/.{2}/g).map(hexDecimalChar => parseInt(hexDecimalChar, 16));
const message3BinaryChars: number[] = message3.match(/.{2}/g).map(hexDecimalChar => parseInt(hexDecimalChar, 16));

const messageBinaryChars: number[] = zip(message1BinaryChars, message2BinaryChars, message3BinaryChars)
    .map(([nthBinaryChar1, nthBinaryChar2, nthBinaryChar3]) => {
        return nthBinaryChar1 ^ nthBinaryChar2 ^ nthBinaryChar3;
    });

const messageChars: string[] = messageBinaryChars.map(messageBinaryChar => String.fromCharCode(messageBinaryChar));

const result: string = messageChars.join('');

// console.log('clear message');
console.log(result);

