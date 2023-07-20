/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

var inputs: string[] = readline().split(' ');
const ws: number[] = [];
for (let i = 0; i < 10; i++) {
    const w: number = parseInt(inputs[i]);
    ws.push(w);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const [firstSecond, firstThird]: number[] = ws.slice(0, 2);
const [thirdFifth, fourthFifth]: number[] = ws.slice(-2);
const sum: number = ws.reduce((sum, w) => sum + w, 0) / 4;

const third: number = sum - firstSecond - fourthFifth;
const first: number = firstThird - third;
const second: number = firstSecond - first;
const fifth: number = thirdFifth - third;
const fourth: number = fourthFifth - fifth;

const result: string = [first, second, third, fourth, fifth].join(' ');

// console.log('answer');
console.log(result);
