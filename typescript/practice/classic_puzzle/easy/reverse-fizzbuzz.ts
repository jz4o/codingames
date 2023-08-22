/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const lines: string[] = [];
for (let i = 0; i < n; i++) {
    const line: string = readline();
    lines.push(line);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const gcdFromArray: Function = (numbers: number[]): number => {
    return numbers.reduce((result, number) => gcd(result, number));
};

const gcd: Function = (a: number, b: number): number => {
    const min: number = Math.min(a, b);
    const max: number = Math.max(a, b);

    return min === 0 ? max : gcd(min, max % min);
};

const firstNumberIndex: number = lines.findIndex(line => line.match(/^\d+$/));
const baseNumber: number = firstNumberIndex === -1 ? 1 : parseInt(lines[firstNumberIndex]) - firstNumberIndex;

const fizzNumbers: number[] = lines.map((line, index) => line.includes('Fizz') ? baseNumber + index : null).filter(number => number);
const buzzNumbers: number[] = lines.map((line, index) => line.includes('Buzz') ? baseNumber + index : null).filter(number => number);

const fizz: number = gcdFromArray(fizzNumbers);
const buzz: number = gcdFromArray(buzzNumbers);

const result: string = `${fizz} ${buzz}`;

// console.log('fizz buzz');
console.log(result);
