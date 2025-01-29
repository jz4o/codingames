/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const ciphertext: string = readline();
const word: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const MIN_ASCII_CODE: number = 32;
const MAX_ASCII_CODE: number = 126;
const ASCII_CODE_SIZE: number = MAX_ASCII_CODE - MIN_ASCII_CODE + 1;

interface DecryptResult {
    key: number;
    message: string;
}

const decryptResult: DecryptResult = [...Array(ASCII_CODE_SIZE).keys()].map(key => {
    const decryptedText: string = ciphertext.split('').map(c => {
        return String.fromCharCode(((c.charCodeAt(0) - MIN_ASCII_CODE - key + ASCII_CODE_SIZE) % ASCII_CODE_SIZE) + MIN_ASCII_CODE);
    }).join('');

    if (!decryptedText.split(/[\s,.?;:!]/).includes(word)) {
        return null;
    }

    return { key, message: decryptedText };
}).filter(decryptResult => decryptResult).shift();

const results: string[] = [
    decryptResult.key.toString(),
    decryptResult.message
];

// console.log('key');
// console.log('plaintext');
results.forEach(result => {
    console.log(result);
});
