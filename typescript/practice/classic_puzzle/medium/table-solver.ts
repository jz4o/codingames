/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputLines: number = parseInt(readline());
const ss: string[] = [];
for (let i = 0; i < inputLines; i++) {
    const s: string = readline();
    ss.push(s);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const zip: <T, U>(a: T[], b: U[]) => [T, U][] = <T, U>(a: T[], b: U[]): [T, U][] => {
    const arraySize: number = Math.max(a.length, b.length);
    return [...Array(arraySize).keys()].map(index => {
        return [a[index], b[index]];
    });
};

const lineLength: number = ss[0].length;
const cellLength: number = ss[0].split('|')[0].length;

const separateRow: string = '_'.repeat(lineLength);// Array(lineLength).fill('_');

const grid: string[][] = ss
    .filter(s => !/^_+$/.test(s))
    .map(s => s.split('|').map(c => c.trim()));

const add: (a: number, b: number) => number = (a: number, b: number): number => a + b;
const sub: (a: number, b: number) => number = (a: number, b: number): number => a - b;
const mul: (a: number, b: number) => number = (a: number, b: number): number => a * b;
const div: (a: number, b: number) => number = (a: number, b: number): number => Math.floor(a / b);

const operationObject: { [key: string]: (a: number, b: number) => number } = {
    '+': add,
    '-': sub,
    x: mul
};
const reverseOperationObject: { [key: string]: (a: number, b: number) => number } = {
    '+': sub,
    '-': add,
    x: div
};

const [[operationStr]]: string[][] = grid;
const operation: (a: number, b: number) => number = operationObject[operationStr];
const reverseOperation: (a: number, b: number) => number = reverseOperationObject[operationStr];

const topNumbers: (number | null)[] = grid[0].slice(1).map(c => c.length === 0 ? null : parseInt(c));
const leftNumbers: (number | null)[] = grid.slice(1).map(row => row[0].length === 0 ? null : parseInt(row[0]));
const numbersGrid: (number | null)[][] = grid.slice(1).map(row => row.slice(1).map(c => c.length === 0 ? null : parseInt(c)));

while ([...topNumbers, ...leftNumbers, ...numbersGrid.flat()].includes(null)) {
    numbersGrid.forEach((row, rowIndex) => {
        row.forEach((value, valueIndex) => {
            const topNumber: number | null = topNumbers[valueIndex];
            const leftNumber: number | null = leftNumbers[rowIndex];
            if ([topNumber, leftNumber, value].filter(v => v === null).length !== 1) {
                return;
            }

            if (topNumber === null) {
                topNumbers[valueIndex] = reverseOperation(value, leftNumber);
            } else if (leftNumber === null) {
                leftNumbers[rowIndex] = operation === sub ? operation(topNumber, value) : reverseOperation(value, topNumber);
            } else if (value === null) {
                numbersGrid[rowIndex][valueIndex] = operation(topNumber, leftNumber);
            }
        });
    });
}

const resultGrid: string[][] = [
    [operationStr, ...topNumbers.map(n => n.toString())],
    ...zip(leftNumbers, numbersGrid).map(([leftNumber, numberRow]) => {
        return [leftNumber.toString(), ...numberRow.map(n => n.toString())];
    })
];

const results: string[] = [];
resultGrid.forEach(resultRow => {
    results.push(resultRow.map(v => v.toString().padEnd(cellLength, ' ')).join('|'));
    results.push(separateRow);
});
results.pop();

// console.log('The finished table');
results.forEach(result => {
    console.log(result);
});
