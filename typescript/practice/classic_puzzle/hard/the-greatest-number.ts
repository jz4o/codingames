/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const _N: number = parseInt(readline());
const input: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

let temp: string = input;

const minusFlag: boolean = input.includes('-');
const dotFlag: boolean = input.includes('.');
temp = temp.replace('-', '').replace('.', '').replace(/\s/g, '');

const digits: number[] = temp.split('').map(i => parseInt(i));
if (minusFlag) {
    temp = digits.sort().join('');
    temp = dotFlag ? temp.replace(temp[0], `${temp[0]}.`) : temp;
    temp = `-${temp}`;
    temp = /^-0\.0+$/.test(temp) ? '0' : temp;
} else {
    temp = digits.sort().reverse().join('');

    if (dotFlag) {
        const lastChar: string = temp[temp.length - 1];
        temp = temp.replace(new RegExp(`${lastChar}$`), `.${lastChar}`);
    }

    temp = temp.replace('.0', '');
}

// console.log('greatest');
console.log(temp);

