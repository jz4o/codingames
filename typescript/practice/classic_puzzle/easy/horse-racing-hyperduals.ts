/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

interface Strength {
    v: number;
    e: number;
}

const N: number = parseInt(readline());
const strengths: Strength[] = [];
for (let i = 0; i < N; i++) {
    const inputs: string[] = readline().split(' ');
    const V: number = parseInt(inputs[0]);
    const E: number = parseInt(inputs[1]);

    strengths.push({v: V, e: E});
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const results: number[] = [];
strengths.forEach((left, lIndex) => {
    strengths.forEach((right, rIndex) => {
        if (rIndex <= lIndex) {
            return;
        }

        results.push(Math.abs(right.v - left.v) + Math.abs(right.e - left.e));
    });
});

// console.log('42');
const result: number = results.reduce((min, result) => Math.min(min, result), results[0]);
console.log(result);

