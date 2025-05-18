/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const thickness: number = parseInt(readline());
const length: number = parseInt(readline());
const turns: number = parseInt(readline());

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const transpose = <T>(array: T[][]): T[][] => {
    const rowSize: number = array.length;
    const columnSize: number = array[0].length;

    const result: T[][] = [];
    [...Array(columnSize).keys()].forEach(columnIndex => {
        const transposedRow: T[] = [];
        [...Array(rowSize).keys()].forEach(rowIndex => {
            transposedRow.push(array[rowIndex][columnIndex]);
        });
        result.push(transposedRow);
    });

    return result;
};

const gridWidth: number = (thickness + 1) * (turns + 1) + 1;

const transposedGrid: string[][] = [...Array(gridWidth).keys()].map(() => {
    return Array(length + 1).fill(' ');
});
transposedGrid[0].splice(1, length, ...Array(length).fill('|'));
transposedGrid[gridWidth - 1].splice(1, length, ...Array(length).fill('|'));
transposedGrid.slice(1, -1).forEach(row => {
    row[0] = '_';
    row[length] = '_';
});
const turnValleyPart: string[] = Array(length - 1).fill('|');
[...Array(turns).keys()].forEach(index => {
    const i: number = (thickness + 1) * (index + 1);
    transposedGrid[i] = (index + 1) % 2 === 1 ? [' ', ...turnValleyPart, '_'] : ['_', ' ', ...turnValleyPart];
});

const results: string[] = transpose(transposedGrid).map(row => {
    return row.join('').trimEnd();
});

// console.log('Print your amazing ASCII worm here!');
results.forEach(result => {
    console.log(result);
});
