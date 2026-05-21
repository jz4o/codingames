/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline(), 10);
const inputs: string[] = readline().split(' ');
const heights: number[] = [];
for (let i = 0; i < N; i++) {
    const height: number = parseInt(inputs[i], 10);
    heights.push(height);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const difficults: number[] = heights.slice(1, -1).flatMap((value, index) => {
    const leftValue: number = Math.min(...heights.slice(0, index + 1));
    const rightValue: number = Math.min(...heights.slice(index + 2));
    if (leftValue >= value || rightValue >= value) {
        return [];
    }

    return value * 2 - leftValue - rightValue;
});

const result: string = Math.max(...difficults).toString();

// console.log('MAXIMAL DIFFICULTY');
console.log(result);
