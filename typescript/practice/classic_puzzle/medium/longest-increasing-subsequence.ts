/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const ps: number[] = [];
for (let i = 0; i < n; i++) {
    const p: number = parseInt(readline());
    ps.push(p);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const sequence: number[] = [];
ps.forEach(p => {
    const replaceIndex: number = sequence.findIndex(elm => p <= elm);

    if (replaceIndex === -1) {
        sequence.push(p);
    } else {
        sequence[replaceIndex] = p;
    }
});

const result: string = sequence.length.toString();

// console.log('answer');
console.log(result);

