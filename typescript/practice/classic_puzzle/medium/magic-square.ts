/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const grid: number[][] = [];
const n: number = parseInt(readline());
for (let i = 0; i < n; i++) {
    const row: number[] = [];

    const inputs: string[] = readline().split(' ');
    for (let j = 0; j < n; j++) {
        const c: number = parseInt(inputs[j]);

        row.push(c);
    }

    grid.push(row);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
};

const transpose = array => array[0].map((_value, index) => array.map(row => row[index]));

const arraySum = (sum, i) => sum + i;
const arrayConcat = (array, element) => array.concat(element);

const expectAllSum: number = rangeArrayFromTo(1, n * n).reduce(arraySum);
const allSum: number = grid.reduce(arrayConcat, []).reduce(arraySum);

const lines: number[][] = [];
lines.push(...grid.map(row => row));
lines.push(...transpose(grid).map(row => row));
lines.push(grid.map((row, index) => row[index]));
lines.push(grid.map((row, index) => row[row.length - index - 1]));

const lineSums: number[] = lines.map(line => line.reduce(arraySum));

const isExpectedAllSum: boolean = allSum === expectAllSum;
const isExpectedAllLineSums: boolean = lineSums.every(sum => sum === lineSums[0]);

const result: string = isExpectedAllSum && isExpectedAllLineSums ? 'MAGIC' : 'MUGGLE';

// console.log('answer');
console.log(result);
