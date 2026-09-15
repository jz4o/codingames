/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline(), 10);

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const fibonacciNumbers: number[] = [1, 2];
while (fibonacciNumbers.at(-1) <= N) {
    fibonacciNumbers.push(fibonacciNumbers.at(-2) + fibonacciNumbers.at(-1));
}
fibonacciNumbers.pop();

const zeckendorfNumbers: number[] = [];
let remainNumber: number = N;
while (remainNumber !== 0) {
    const nextNumber: number = fibonacciNumbers.flatMap(num => num <= remainNumber ? num: []).at(-1);

    zeckendorfNumbers.push(nextNumber);
    remainNumber -= nextNumber;
}

const result: string = zeckendorfNumbers.join('+');

// console.log('representation');
console.log(result);
