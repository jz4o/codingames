/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const x: string = readline();
const n: number = parseInt(readline());

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const ALPHAS: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

const alphaToInt = (alpha: string): number => {
    return alpha.split('').reverse().reduce((alphaIntSum, value, index) => {
        const alphaInt = Math.pow(ALPHAS.length, index) * (ALPHAS.indexOf(value) + 1);
        return alphaIntSum + alphaInt;
    }, 0);
};

const intToAlpha = (alphaInt: number): string => {
    let tempAlphaInt: number = alphaInt;
    let result: string = '';
    while (tempAlphaInt > 0) {
        let i = tempAlphaInt % ALPHAS.length;
        if (i === 0) {
            i = ALPHAS.length;
            tempAlphaInt--;
        }
        tempAlphaInt = tempAlphaInt > ALPHAS.length ? Math.trunc(tempAlphaInt / ALPHAS.length) : 0;

        result= `${ALPHAS.charAt(i - 1)}${result}`;
    }

    return result;
};

const repeatStr = (str: string, count: number): string => {
    return Array(count + 1).join(str);
};

const zeroPadLeft = (str: string, length: number): string => {
    return `${repeatStr('0', length)}${str}`.substr(length * -1);
};

const xElements: string[] = x.split('-');
const ad: string = xElements[0];
let cde: number = parseInt(xElements[1]);
const fg: string = xElements[2];

const alpha: string = `${ad}${fg}`;
const alphaInt: number = alphaToInt(alpha);
cde = cde + n - 1;

const carry: number = Math.trunc(cde / 999);
cde %= 999;

const newAlpha = intToAlpha(alphaInt + carry);
const newAd = newAlpha.substring(0, 2);
const newCde = zeroPadLeft(`${cde + 1}`, 3);
const newFg: string = newAlpha.substring(2);

// console.log('AA-000-AA');
console.log(`${newAd}-${newCde}-${newFg}`);

