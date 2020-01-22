/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
let pis: number[] = [];
for (let i = 0; i < N; i++) {
    const pi: number = parseInt(readline());
    pis.push(pi);
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

let minimumDiff = 10000000 - 0;
pis.sort(function(a: number, b: number) { return a < b ? -1 : 1 });
for (let i = 0; i < pis.length - 1; i++) {
    const diff = pis[i + 1] - pis[i]
    if (diff < minimumDiff) {
        minimumDiff = diff;
    }
}

// console.log('answer');
console.log(minimumDiff);
