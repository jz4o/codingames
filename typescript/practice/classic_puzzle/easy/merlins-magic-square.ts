/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const row1: string = readline();
const row2: string = readline();
const row3: string = readline();
const allButtonsPressed: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const FULL_BIT: number = 0b111111111;
const REVERSE_CENTER_BIT: number = 0b000010000;
const REVERSE_BITS: number[] = [
    0b000000000,
    0b110110000,
    0b111000000,
    0b011011000,
    0b100100100,
    0b010111010,
    0b001001001,
    0b000110110,
    0b000000111,
    0b000011011
];

const beforeButtonBitStr: string = `${row1}${row2}${row3}`.replace(/\s/g, '').replace(/~/g, '0').replace(/\*/g, '1');
const beforeButtonBit: number = parseInt(beforeButtonBitStr, 2);
const afterButtonBit: number = allButtonsPressed
    .split('')
    .reduce((buttonBit, button) => buttonBit ^ REVERSE_BITS[parseInt(button)], beforeButtonBit);

const result: number = REVERSE_BITS.indexOf((FULL_BIT - afterButtonBit) ^ REVERSE_CENTER_BIT);

// console.log('answer (a single digit)');
console.log(result);

