/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const number: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type ConverterKey = 'from' | 'toV' | 'toH' | 'toVh';

const converter: { [key in ConverterKey]: string } = {
  'from': '0123456789abcdef',
  'toV': '0153#2e#8a9#c#6#',
  'toH': '015##2a#8e6d#b9#',
  'toVh': '012##59#86e###a#'
};

const binary: string = BigInt(`0x${number}`).toString(2);

const bits: string[] = binary.split('');
const isVReverse: boolean = bits.filter(b => b === '1').length % 2 === 1;
const isHReverse: boolean = bits.filter(b => b === '0').length % 2 === 1;

let convertTo: ConverterKey;
if (isVReverse && isHReverse) {
    convertTo = 'toVh';
} else if (isVReverse) {
    convertTo = 'toV';
} else if (isHReverse) {
    convertTo = 'toH';
} else {
    convertTo = 'from';
}

let result: string = number.split('').map(n => converter[convertTo].charAt(converter.from.indexOf(n))).join('');
if (isHReverse) {
    result = result.split('').reverse().join('');
}

if (result.includes('#')) {
    result = 'Not a number';
}

result = result.slice(0, 1000);

// console.log('hexflipped_number');
console.log(result);
