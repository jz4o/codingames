/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const textToDecode: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const ALPHABETS: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

let words: string[] = textToDecode.split(' ');

let result: string = 'WRONG MESSAGE';
[...Array(ALPHABETS.length).keys()].some(() => {
    if (words.includes('CHIEF')) {
        result = words.join(' ');
        return true;
    }

    words = words.map(word => {
        return word
            .split('')
            .map(char => ALPHABETS.charAt((ALPHABETS.indexOf(char) || ALPHABETS.length) - 1))
            .join('');
    });

    return false;
});

// console.log('DecodedText:string(101)');
console.log(result);
