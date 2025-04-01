/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline()); // the number of mountains
const inputs: string[] = readline().split(' ');
const heights: number[] = [];
for (let i = 0; i < n; i++) {
    const height: number = parseInt(inputs[i]);
    heights.push(height);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const eachCons: <T>(targetArray: T[], n: number) => T[][] = <T>(targetArray: T[], n: number): T[][] => {
    return [...Array(targetArray.length - n + 1).keys()].map(i => {
        return targetArray.slice(i, i + n);
    });
};

const transpose: <T>(array: T[][]) => T[][] = <T>(array: T[][]): T[][] => {
    return array[0].map((_value, index) => array.map(row => row[index]));
};

const createRow: (width: number, strIndex: number, str: string) => string[] = (width: number, strIndex: number, str: string): string[] => {
    const row: string[] = Array(width).fill(' ');
    row[strIndex] = str;

    return row;
};

const maxHeight: number = Math.max(...heights, 0);
const minHeight: number = Math.min(...heights, 0);

const gridHeight: number = maxHeight - minHeight + 1;

const grid: string[][] = eachCons([0, ...heights, 0], 2).flatMap(([a, b]) => {
    if (a <= b) {
        return [
            createRow(gridHeight, maxHeight - a, '\\'),
            ...[...Array(b - a + 1).keys()].map(i => createRow(gridHeight, maxHeight - a - i, '/'))
        ];
    } else {
        return [
            ...[...Array(a - b + 1).keys()].map(i => createRow(gridHeight, maxHeight - a + i, '\\')),
            createRow(gridHeight, maxHeight - b, '/')
        ];
    }
});

const beginWidthIndex: number = heights.length > 0 && heights[0] > 0 ? 2 : 0;
const endWidthIndex: number | null = heights.length > 0 && heights.at(-1) > 0 ? -2 : grid.length;
const effectiveHeight: number = Math.min(...heights) > 0 ? maxHeight : gridHeight;

const effectiveGrid: string[][] = grid.slice(beginWidthIndex, endWidthIndex).map(row => row.slice(0, effectiveHeight));

const results: string[] = transpose(effectiveGrid).map(row => row.join('').trimEnd());

// console.log('mountains');
results.forEach(result => {
    console.log(result);
});
