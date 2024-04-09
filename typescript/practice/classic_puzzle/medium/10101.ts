/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const W: number = parseInt(readline());
const H: number = parseInt(readline());
const grid: string[][] = [];
for (let i = 0; i < H; i++) {
    const ROW: string = readline();

    grid.push(ROW.split(''));
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
};

const transpose = <T>(array: T[][]): T[][] => {
    const rowSize: number = array.length;
    const columnSize: number = array[0].length;

    const result: T[][] = [];
    rangeArrayFromTo(0, columnSize - 1).forEach(columnIndex => {
        const transposedRow: T[] = [];
        rangeArrayFromTo(0, rowSize - 1).forEach(rowIndex => {
            transposedRow.push(array[rowIndex][columnIndex]);
        });
        result.push(transposedRow);
    });

    return result;
};

const horizontalBlockCount: number[] = grid.map(row => row.filter(cell => cell === '#').length);
const verticalBlockCount: number[] = transpose(grid).map(row => row.filter(cell => cell === '#').length);

const filledHorizontalLineCount: number = horizontalBlockCount.filter(count => count === W).length;
const filledVerticalLineCount: number = verticalBlockCount.filter(count => count === H).length;
const filledCount: number = filledHorizontalLineCount + filledVerticalLineCount;

const result: number = grid.reduce((rowResult, row, rowIndex) => {
    if (rowIndex === H - 1) {
        return rowResult;
    }

    return row.reduce((columnResult, column, columnIndex) => {
        if (columnIndex === W - 1) {
            return columnResult;
        }

        const targetMasses: string[] = [];
        targetMasses.push(grid[rowIndex][columnIndex]);
        targetMasses.push(grid[rowIndex][columnIndex + 1]);
        targetMasses.push(grid[rowIndex + 1][columnIndex]);
        targetMasses.push(grid[rowIndex + 1][columnIndex + 1]);
        if (!targetMasses.every(mass => mass === '.')) {
            return columnResult;
        }

        let newFilledLineCount: number = 0;
        newFilledLineCount += horizontalBlockCount[rowIndex]      + 2 === W ? 1 : 0;
        newFilledLineCount += horizontalBlockCount[rowIndex + 1]  + 2 === W ? 1 : 0;
        newFilledLineCount += verticalBlockCount[columnIndex]     + 2 === H ? 1 : 0;
        newFilledLineCount += verticalBlockCount[columnIndex + 1] + 2 === H ? 1 : 0;

        return Math.max(columnResult, filledCount + newFilledLineCount);
    }, rowResult);
}, filledCount);

// console.log('answer');
console.log(result);
