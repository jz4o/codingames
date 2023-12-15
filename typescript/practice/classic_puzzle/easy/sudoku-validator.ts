/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const ns: number[] = [];
for (let i = 0; i < 9; i++) {
    const inputs: string[] = readline().split(' ');
    for (let j = 0; j < 9; j++) {
        const n: number = parseInt(inputs[j]);
        ns.push(n);
    }
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const transpose: <T>(array: T[][]) => T[][] = <T>(array: T[][]): T[][] => {
    return array[0].map((_value, index) => array.map(row => row[index]));
};

const getNumberOfKind: <T>(array: T[]) => number = <T>(array: T[]): number => {
    return [...new Set(array)].length;
};

const KIND_OF_NUMBERS: number = 9;

const grid: number[][] = [...Array(KIND_OF_NUMBERS).keys()].map(i => ns.slice(KIND_OF_NUMBERS * i, KIND_OF_NUMBERS * (i + 1)));
const subGrids: number[][] = [...Array(KIND_OF_NUMBERS).keys()].map(() => []);
[...Array(KIND_OF_NUMBERS).keys()].forEach(rowIndex => {
    [...Array(KIND_OF_NUMBERS).keys()].forEach(columnIndex => {
        const subGridIndex: number = (Math.floor(rowIndex / 3) * 3) + Math.floor(columnIndex / 3)
        subGrids[subGridIndex].push(grid[rowIndex][columnIndex]);
    });
});

const lineNumberCounts: number[] = [...grid, ...transpose(grid), ...subGrids].map(getNumberOfKind);

const result: string = lineNumberCounts.every(numberCount => numberCount === KIND_OF_NUMBERS).toString();

// console.log('true or false');
console.log(result);
