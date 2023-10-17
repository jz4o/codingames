/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const W: number = parseInt(inputs[0]);
const H: number = parseInt(inputs[1]);
const rows: string[] = [];
for (let i = 0; i < H; i++) {
    const row: string = readline();
    rows.push(row);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const EMPTY_CHARACTER: string = '.';
const FULL_CHARACTER: string = 'X';

const pixels: string = rows.join('');
const pixelChars: string[] = pixels.split('');

const fullCharacterPoints: number = pixelChars.filter(pixel => pixel === FULL_CHARACTER).length;
const otherCharacterPoints: number = pixelChars.filter(pixel => pixel !== EMPTY_CHARACTER && pixel !== FULL_CHARACTER).length / 2;
const points: number = fullCharacterPoints + otherCharacterPoints;

const pixelSize: number = W * H;

let result: string;
if (points === pixelSize) {
    result = 'Rectangle';
} else if (points > pixelSize / 2) {
    result = 'Ellipse';
} else {
    result = 'Triangle';
}

// console.log('Rectangle/Triangle/Ellipse');
console.log(result);
