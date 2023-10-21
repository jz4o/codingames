/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const w: number = parseInt(inputs[0]);
const h: number = parseInt(inputs[1]);
const pixels: number[] = [];
for (let i = 0; i < h; i++) {
    const inputs: string[] = readline().split(' ');
    for (let j = 0; j < w; j++) {
        const pixel: number = parseInt(inputs[j]);
        pixels.push(pixel);
    }
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const bits: string = pixels.map(pixel => pixel % 2).join('');
const result: string = bits
    .match(/.{8}/g)
    .map(bit => String.fromCharCode(parseInt(bit, 2)))
    .join('');

// console.log('answer');
console.log(result);
