/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const primeDivision = (num: number): number[] => {
    const result: number[] = [];

    let tempNum: number = num;
    while (tempNum % 2 === 0) {
        result.push(2);
        tempNum /= 2;
    }

    let i: number = 3;
    while (tempNum !== 1) {
        if (tempNum % i === 0) {
            result.push(i);
            tempNum /= i;
        } else {
            i += 2;
        }
    }

    return result;
};

const rangeArrayFromTo = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
};

const isPrime = (num: number): boolean => {
    return rangeArrayFromTo(2, num - 1).every(i => num % i !== 0);
};

const derivationNumber = (num: number): number => {
    if (isPrime(num)) {
        return 1;
    }

    const maxPrime: number = primeDivision(num).reduce((max, division) => Math.max(max, division));
    const divNum: number = Math.floor(num / maxPrime);

    return divNum + (maxPrime * derivationNumber(divNum));
};

const result: number = derivationNumber(n);

// console.log('n_prime');
console.log(result);
