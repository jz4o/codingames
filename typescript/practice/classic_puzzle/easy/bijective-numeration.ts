/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const count: number = parseInt(readline());
const inputs: string[] = readline().split(' ');
const decimaries: string[] = [];
for (let i = 0; i < count; i++) {
    const decimary: string = inputs[i];
    decimaries.push(decimary);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const toDecimal: (decimary: string) => number = (decimary: string): number => {
    const aceIndexes: number[] = decimary
        .split('')
        .reverse()
        .map((char, index) => char === 'A' ? index : null)
        .filter(index => index !== null);

    const otherAceDecimal: number = parseInt(decimary.replace(/A/g, '0'));
    const aceDecimal: number = aceIndexes.reduce((sum, index) => sum + Math.pow(10, index + 1), 0);

    return otherAceDecimal + aceDecimal;
};

const toDecimary: (decimal: number) => string = (decimal: number): string => {
    if (decimal === 0 || !decimal.toString().includes('0')) {
        return decimal.toString();
    }

    const digits: number[] = decimal.toString().split('').map(c => parseInt(c));
    while (digits.slice(1).includes(0)) {
        digits.slice(1).forEach((digit, index) => {
            if (digit !== 0) {
                return;
            }

            digits[index]--;
            digits[index + 1] = 10;
        });
    }

    const decimary: string = digits.map(digit => digit === 10 ? 'A' : digit.toString()).join('');

    return decimary.replace(/^0+/, '');
};

const sumDecimal: number = decimaries.reduce((sum, decimary) => sum + toDecimal(decimary), 0);

const result: string =toDecimary(sumDecimal);

// console.log('summation');
console.log(result);
