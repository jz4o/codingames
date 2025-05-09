/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const P: number = parseInt(readline());
const C: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const decode = (encodedValue: number, alphabet: string): string => {
    let result: string = '';
    let int: number = encodedValue + 1;
    while (int > 0) {
        let mod = int % alphabet.length;
        int = Math.floor(int / alphabet.length);
        if (mod === 0) {
            mod = alphabet.length;
            int--;
        }

        result += alphabet[mod - 1];
    }

    return result;
};

// console.log('Good Luck :->');
console.log(decode(P, C));
