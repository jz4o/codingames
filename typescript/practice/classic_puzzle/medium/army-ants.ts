/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

var inputs: string[] = readline().split(' ');
const N1: number = parseInt(inputs[0]);
const N2: number = parseInt(inputs[1]);
const S1: string = readline();
const S2: string = readline();
const T: number = parseInt(readline());

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const s1MovePart: string[] = S1.substring(0, T).split('').reverse();
const s2MovePart: string[] = S2.substring(0, T).split('');

while (s1MovePart.length < T) {
    s1MovePart.unshift(null);
}
while (s2MovePart.length < T) {
    s2MovePart.push(null);
}

const s1NotMovePart: string = S1.substring(T).split('').reverse().join('');
const s2NotMovePart: string = S2.substring(T);

const sMovedPart: string = s2MovePart.map((value, index) => {
    return `${value || ''}${s1MovePart[index] || ''}`
}).join('');

// console.log('answer');
console.log(`${s1NotMovePart}${sMovedPart}${s2NotMovePart}`);
