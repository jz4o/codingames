/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const k: number = parseInt(readline());
const inputs: string[] = readline().split(' ');
let lis: number[] = [];
for (let i = 0; i < n; i++) {
    const li: number = parseInt(inputs[i]);
    lis.push(li);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

let i: number = k;
while (i > 0) {
    lis = lis.sort((a, b) => a - b);

    const [firstElement]: number[] = lis;
    const notFirstElementIndex: number= lis.findIndex(li => li !== firstElement);
    const firstElementCount: number = notFirstElementIndex !== -1 ? notFirstElementIndex : lis.length;
    const size: number = Math.min(firstElementCount, i);

    lis.splice(0, size, ...Array(size).fill(firstElement + 1));

    i -= size;
}

lis = lis.sort((a, b) => a - b);
const [min, max]: [number, number] = [lis[0], lis[lis.length - 1]];

const result: number = max - min;

// console.log('answer');
console.log(result);

