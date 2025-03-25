/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const k: number = parseInt(readline());

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const digits: number[] = n.toString().split('').reverse().map(c => parseInt(c));

const sumCount: number = [...Array(digits.length).keys()].reduce((sumCount, index) => {
    const digit: number = digits[index];

    let digitCount: number = 0;

    digitCount += [...Array(index).keys()].reduce((sum, i) => {
        const w: number = Math.pow(10, i);
        const c: number = Math.pow(10, index - i - 1);

        return sum + (w * c * digit);
    }, 0);

    if (digit === k) {
        const kindOfLowerDigits: number = parseInt(digits.slice(0, index).reverse().join('') || '0') + 1;
        digitCount += kindOfLowerDigits;
    } else if (digit > k) {
        digitCount += Math.pow(10, index);
    }

    return sumCount + digitCount;
}, 0);

const result: string = sumCount.toString();

// console.log('answer');
console.log(result);
