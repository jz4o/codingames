/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const line1: string = readline();
const line2: string = readline();
const line3: string = readline();
const line4: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const lines: string[] = [line1, line2, line3, line4];
const square: number[][] = lines.map(line => line.split('').map(i => parseInt(i)));
let squareSum: number = square.reduce((sum, row) => {
    return sum + row.reduce((rowSum, column) => rowSum + column);
}, 0);

const rangeArrayFromTo = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
}

const optimize = (square: number[][]) => {
    square.forEach((row, rowIndex) => {
        row.forEach((column, columnIndex) => {
            if (column !== 0) {
                return;
            }

            const verticalLine: number[] = square.map(row => row[columnIndex]);

            const littleSquareRows: number[] = rowIndex < Math.trunc(square.length / 2) ? [0, 1] : [2, 3];
            const littleSquareColumns: number[] = columnIndex < Math.trunc(row.length / 2) ? [0, 1] : [2, 3];
            const littleSquare: number[] = littleSquareRows.reduce((littleSquare, littleSquareRow) => {
                littleSquareColumns.forEach(littleSquareColumn => littleSquare.push(square[littleSquareRow][littleSquareColumn]));
                return littleSquare;
            }, []);

            const candidate: number[] = [1, 2, 3, 4].filter(num => row.indexOf(num) === -1)
                                                    .filter(num => verticalLine.indexOf(num) === -1)
                                                    .filter(num => littleSquare.indexOf(num) === -1);

            if (candidate.length === 1) {
                const value: number = candidate.pop();
                square[rowIndex][columnIndex] = value;
                squareSum += value;
            }
        });
    });
}

const expectSum: number = rangeArrayFromTo(1, square.length).reduce((sum, i) => sum + i) * square.length;
while (expectSum !== squareSum) {
    optimize(square);
}

// console.log('answer');
square.forEach(line => {
    console.log(line.join(''));
})
