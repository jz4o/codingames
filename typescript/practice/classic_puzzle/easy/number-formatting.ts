/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const numbertext: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

let isCarryUp: number = 0;
let isSignificantDigit: boolean = false;
const digits: string[] = numbertext.split('').map(d => {
    if (!/\d|x/.test(d) || (d === 'x' && isCarryUp === 0)) {
        return d;
    }

    const div: number = Math.floor((isCarryUp + parseInt(d !== 'x' ? d : '0')) / 2);
    const mod: number = (isCarryUp + parseInt(d !== 'x' ? d : '0')) % 2;

    isCarryUp = mod * 10;
    isSignificantDigit ||= 0 < div;

    return isSignificantDigit ? div.toString() : 'x';
});

const result: string = digits.join('');

// console.log('answer');
console.log(result);
