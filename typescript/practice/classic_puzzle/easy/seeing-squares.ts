/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const r: number = parseInt(inputs[0]);
const _c: number = parseInt(inputs[1]);
const rows: string[] = [];
for (let i = 0; i < r; i++) {
    const row: string = readline();
    rows.push(row);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const CORNER_CHAR: string = '+';
const HORIZONTAL_CHAR: string = '-';
const VERTICAL_CHAR: string = '|';

const HORIZONTAL_CHARS: string[] = [HORIZONTAL_CHAR, CORNER_CHAR];
const VERTICAL_CHARS: string[] = [VERTICAL_CHAR, CORNER_CHAR];

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const eachCons: <T>(targetArray: T[], n: number) => T[][] = <T>(targetArray: T[], n: number): T[][] => {
    return [...Array(targetArray.length - n + 1).keys()].map(i => {
        return targetArray.slice(i, i + n);
    });
};

const grid: string[][] = rows.map(row => row.split(''));

let count: number = 0;
grid.slice(0, -1).forEach((row, rowIndex) => {
    row.slice(0, -1).forEach((value, columnIndex) => {
        if (value !== CORNER_CHAR) {
            return;
        }

        const belowCornerRowIndexes: number[] = rangeArrayFromTo(rowIndex + 1, r - 1).filter(ri => grid[ri][columnIndex] === CORNER_CHAR);
        eachCons([rowIndex, ...belowCornerRowIndexes], 2).some(([prevBelowRowIndex, belowRowIndex]) => {
            const prevHeight: number = prevBelowRowIndex - rowIndex + 1;
            const prevRightColumnIndex: number = columnIndex + prevHeight * 2 - 2;

            const height: number = belowRowIndex - rowIndex + 1;
            const rightColumnIndex: number = columnIndex + height * 2 - 2;

            const topHorizontalValues: string[] = grid[rowIndex].slice(prevRightColumnIndex, rightColumnIndex);
            const bottomHorizontalValues: string[] = grid[belowRowIndex].slice(columnIndex + 1, rightColumnIndex);
            const leftVerticalValues: string[] = grid.slice(prevBelowRowIndex, belowRowIndex).map(belowRow => belowRow[columnIndex]);
            const rightVerticalValues: string[] = grid.slice(rowIndex + 1, belowRowIndex).map(belowRow => belowRow[rightColumnIndex]);
            const rightCornerValues: string[] = [
                grid[rowIndex][rightColumnIndex],
                grid[belowRowIndex][rightColumnIndex],
            ];

            if (!topHorizontalValues.every(value => HORIZONTAL_CHARS.includes(value))) {
                return true;
            }
            if (!leftVerticalValues.every(value => VERTICAL_CHARS.includes(value))) {
                return true;
            }

            if (!rightCornerValues.every(value => value === CORNER_CHAR)) {
                return false;
            }
            if (!bottomHorizontalValues.every(value => HORIZONTAL_CHARS.includes(value))) {
                return false;
            }
            if (!rightVerticalValues.every(value => VERTICAL_CHARS.includes(value))) {
                return false;
            }

            count++;

            return false;
        });
    });
});

const result: string = count.toString();

// console.log('[][][]');
console.log(result);
