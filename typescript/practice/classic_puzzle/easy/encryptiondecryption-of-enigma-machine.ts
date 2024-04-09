/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const operation: string = readline();
const pseudoRandomNumber: number = parseInt(readline());
const rotors: string[] = [];
for (let i = 0; i < 3; i++) {
    const rotor: string = readline();
    rotors.push(rotor);
}
const message: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const alphabet: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

let result: string;
if (operation === 'ENCODE') {
    const messageChars: string[] = message.split('').map((char, index) => {
        const alphabetIndex: number = alphabet.indexOf(char);
        const messageChar: string = alphabet[(alphabetIndex + pseudoRandomNumber + index) % alphabet.length];

        return messageChar;
    });

    const encodedMessageChars = rotors.reduce((message, rotor) => message.map(messageChar => {
        return rotor.split('')[alphabet.indexOf(messageChar)];
    }), messageChars);

    result = encodedMessageChars.join('');
} else {
    const messageChars: string[] = rotors.reverse().reduce((messageChars, rotor) => {
        return messageChars.map(messageChar => alphabet[rotor.split('').indexOf(messageChar)]);
    }, message.split(''));

    const decodedMessageChars: string[] = messageChars.map((char, index) => {
        let alphabetIndex: number = alphabet.indexOf(char);
        alphabetIndex -= pseudoRandomNumber;
        alphabetIndex -= index;
        alphabetIndex %= alphabet.length;

        if (alphabetIndex < 0) {
            alphabetIndex += alphabet.length;
        }

        return alphabet[alphabetIndex];
    });

    result = decodedMessageChars.join('');
}

// console.log('message');
console.log(result);
