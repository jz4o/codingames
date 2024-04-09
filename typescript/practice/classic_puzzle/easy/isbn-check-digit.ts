/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const isbns: string[] = [];
for (let i = 0; i < N; i++) {
    const ISBN: string = readline();

    isbns.push(ISBN);
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const MODULUS_WEIGHTS: {[key: number]: number[]} = {
    10: [1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3],
    11: [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
};

const invalids: string[] = [];
isbns.forEach(isbn => {
    if (!/^\d+X?$/.test(isbn)) {
        invalids.push(isbn);
        return;
    }

    let modulus: number;
    switch(isbn.length) {
        case 10:
            modulus = 11;
            break;
        case 13:
            if (isbn.endsWith('X')) {
                invalids.push(isbn);
                return;
            }

            modulus = 10;
            break;
        default:
            invalids.push(isbn);
            return;
    }

    const dataDigits: number[] = isbn.split('').map(d => ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'X'].indexOf(d));
    const checkDigit: number = dataDigits.pop();

    const sum: number = dataDigits.reduce((sum, digit, index) => {
        return sum + digit * MODULUS_WEIGHTS[modulus][index];
    }, 0);

    const checkSum: number = (modulus - (sum % modulus)) % modulus;
    if (checkSum !== checkDigit) {
        invalids.push(isbn);
    }
});

// console.log('answer');
console.log(`${invalids.length} invalid:`);
invalids.forEach(invalid => {
    console.log(invalid);
});
