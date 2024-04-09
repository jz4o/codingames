/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const n: number = parseInt(inputs[0]);
const k: number = parseInt(inputs[1]);

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const results: number[][] = [];
const temps: number[][] = [];
for (let i = 1; i <= k; i++) {
    temps.push([i]);
}

while (temps.length > 0) {
    const temp: number[] = temps.pop();
    const tempSum: number = temp.reduce((sum, t) => sum + t, 0);

    if (tempSum === n) {
        results.unshift(temp);
    } else if (tempSum < n) {
        for (let i = 1; i <= k; i++) {
            temps.push(temp.concat(i));
        }
    }
}

// console.log('answer');
for (const result of results) {
    console.log(result.join(' '));
}

