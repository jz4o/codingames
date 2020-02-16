/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const L: number = parseInt(readline());
const H: number = parseInt(readline());
const T: string = readline();
const rows: string[] = [];
for (let i = 0; i < H; i++) {
    const ROW: string = readline();

    rows.push(ROW);
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const ALPHAS: string[] = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ?'.split('');
let result: string[] = Array(H).fill('');

T.toUpperCase().split('').forEach(t => {
    let alphaIndex = ALPHAS.indexOf(t);
    alphaIndex = alphaIndex >= 0 ? alphaIndex : ALPHAS.length - 1;

    for (let h = 0; h < H; h++) {
        result[h] += rows[h].substring(L * alphaIndex, L * alphaIndex + L);
    }
});

// console.log('answer');
result.forEach(resultRow => console.log(resultRow));
