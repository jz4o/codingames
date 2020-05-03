/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const lhs: string = readline();
const op: string = readline();
const rhs: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const balanceToDecimal = (balance: string): number => {
    return balance.split('').reverse().reduce((sum, i, index) => {
        return sum + (i === 'T' ? -1 : parseInt(i)) * Math.pow(BASE_NUMBER, index);
    }, 0);
}

const decimalToBalance = (decimal: number): string => {
    const digits: string[] = [];
    while (decimal !== 0) {
        let mod: string = (decimal % BASE_NUMBER).toString();
        decimal = Math.trunc(decimal / BASE_NUMBER);

        if (mod === (BASE_NUMBER - 1).toString()) {
            mod = 'T';
            decimal++;
        }

        digits.unshift(mod)
    }

    return digits.length === 0 ? '0' : digits.join('');
}

const BASE_NUMBER: number = 3;

const decimalLhs: number = balanceToDecimal(lhs);
const decimalRhs: number = balanceToDecimal(rhs);

let resultDecimal: number;
if (op === '+') {
    resultDecimal = decimalLhs + decimalRhs;
} else if (op === '-') {
    resultDecimal = decimalLhs - decimalRhs;
} else if (op === '*') {
    resultDecimal = decimalLhs * decimalRhs;
} else if (op === '<<') {
    resultDecimal = decimalLhs * Math.pow(BASE_NUMBER, decimalRhs);
} else if (op === '>>') {
    resultDecimal = Math.trunc(decimalLhs / Math.pow(BASE_NUMBER, decimalRhs));
}

const resultBalance: string = decimalToBalance(resultDecimal);

// console.log('11T');
console.log(resultBalance);
