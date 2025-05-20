/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const isPrime = (num: number) => {
    if (num % 2 === 0) {
        return false;
    }

    for (let i = 3; i < num; i+=2) {
        if (num % i === 0) {
            return false;
        }
    }

    return true;
};

const primeDivision = (num) => {
    const divisions: number[] = [];

    while (num % 2 === 0) {
        divisions.push(2);
        num /= 2;
    }

    let i: number = 3;
    while (num !== 1) {
        if (num % i === 0) {
            divisions.push(i);
            num /= i;
        } else {
            i += 2;
        }
    }

    return divisions;
};

const primeFlag: boolean = isPrime(n);
let carmichaelFlag: boolean = !primeFlag;

for (const primeFactor of primeDivision(n)) {
    if ((n - 1) % (primeFactor - 1) !== 0) {
        carmichaelFlag = false;
        break;
    }
}

// console.log('YES|NO');
console.log(carmichaelFlag ? 'YES' : 'NO');

