/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const ts: string[] = [];
for (let i = 0; i < N; i++) {
    const t: string = readline();

    ts.push(t);
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const result = ts.reduce((min, t) => t < min ? t : min);

// console.log('answer');
console.log(result);
