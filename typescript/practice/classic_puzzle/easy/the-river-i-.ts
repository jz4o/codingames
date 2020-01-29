/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const r1: number = parseInt(readline());
const r2: number = parseInt(readline());

// Write an action using console.log()
// To debug: console.error('Debug messages...');

let r1Temp: number = r1;
let r2Temp: number = r2;

while (r1Temp !== r2Temp) {
    if (r1Temp < r2Temp) {
        for (const c of String(r1Temp).split('')) {
            r1Temp += parseInt(c);
        }
    } else {
        for (const c of String(r2Temp).split('')) {
            r2Temp += parseInt(c);
        }
    }
}

// console.log('42');
console.log(r1Temp)
