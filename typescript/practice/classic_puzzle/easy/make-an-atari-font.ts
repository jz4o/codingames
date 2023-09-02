/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const aWord: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const transpose = <T>(array: T[][]): T[][] => array[0].map((_value, index) => array.map(row => row[index]));

const HEX_VALUES: { [key: string]: number } = {
  A: 0x1818243C42420000,
  B: 0x7844784444780000,
  C: 0x3844808044380000,
  D: 0x7844444444780000,
  E: 0x7C407840407C0000,
  F: 0x7C40784040400000,
  G: 0x3844809C44380000,
  H: 0x42427E4242420000,
  I: 0x3E080808083E0000,
  J: 0x1C04040444380000,
  K: 0x4448507048440000,
  L: 0x40404040407E0000,
  M: 0x4163554941410000,
  N: 0x4262524A46420000,
  O: 0x1C222222221C0000,
  P: 0x7844784040400000,
  Q: 0x1C222222221C0200,
  R: 0x7844785048440000,
  S: 0x1C22100C221C0000,
  T: 0x7F08080808080000,
  U: 0x42424242423C0000,
  V: 0x8142422424180000,
  W: 0x4141495563410000,
  X: 0x4224181824420000,
  Y: 0x4122140808080000,
  Z: 0x7E040810207E0000
};

const TRANSPOSED_ATARI_BIT_MAPS: { [key: string]: string[][] } = {};
Object.entries(HEX_VALUES).forEach(([key, value]) => {
    const binaryValue: string = value.toString(2).padStart(64, '0');
    const atariValue: string = binaryValue.replaceAll('0', ' ').replaceAll('1', 'X');
    const transposedValue: string[][] = transpose([...atariValue.matchAll(/.{8}/g)].map(row => row.toString().split('')));

    TRANSPOSED_ATARI_BIT_MAPS[key] = transposedValue;
});

const transposedResultMap: string[][] = aWord.split('').flatMap(char => TRANSPOSED_ATARI_BIT_MAPS[char]);
const resultRows: string[] = transpose(transposedResultMap).map(row => row.join('').trimEnd());

const lastPrintIndex: number = resultRows.length - [...resultRows].reverse().findIndex(row => row.trim() !== '') - 1;
const results: string[] = resultRows.slice(0, lastPrintIndex + 1);

// console.log('that word in Atari Font');
results.forEach(result => {
    console.log(result);
});
