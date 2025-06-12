/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

// @a, @b = gets.split(" ").collect {|x| x.to_i}
const inputs: string[] = readline().split(' ');
const a: number = parseInt(inputs[0]);
const b: number = parseInt(inputs[1]);

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

let high: number = Math.max(a, b);
let low: number = Math.min(a, b);

const results: string[] = [];

// initial formula
results.push(`${high} * ${low}`);

let addNums: string = '';
while (low !== 0) {
    if (low % 2 === 0) {
        high *= 2;
        low = Math.trunc(low / 2);
    } else {
        addNums = `${addNums} + ${high}`;
        low--;
    }

    // way formula
    results.push(`= ${high} * ${low}${addNums}`);
}

// answer
results.push(`= ${a * b}`);

// console.log('answer');
results.forEach(result => {
    console.log(result);
});

