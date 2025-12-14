/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const ss: string[] = [];
for (let i = 0; i < 5; i++) {
    const s: string = readline();
    ss.push(s);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const transpose: <T>(array: T[][]) => T[][] = <T>(array: T[][]): T[][] => {
    return array[0].map((_value, index) => array.map(row => row[index]));
};

const CHINESE_NUMBERS: string[] = [
  '*000*0***00***00***0*000*',
  '**********00000**********',
  '00000***************00000',
  '00000******000******00000',
  '000000*0*000*000***000000',
  '00000**0***0000**0*000000',
  '**0****0**00000*0*0*0***0',
  '**0****0**00000**0****000',
  '*0*0**0*0**0*0**0*0*0***0',
  '**0****0**0000**0*0*0**00',
];

const chineseNumbers: string[] = transpose(ss.map(s => s.split(' '))).map(transposedS => transposedS.join(''));
const numbers: number[] = chineseNumbers.map(chineseNumber => CHINESE_NUMBERS.indexOf(chineseNumber));

const result: string = numbers.join('');

// console.log('The number');
console.log(result);
