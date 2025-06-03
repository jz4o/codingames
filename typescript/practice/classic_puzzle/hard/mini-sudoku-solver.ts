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

class MiniSudoku {
    static solve = (square: number[][]): number[][] => {
        const cloneSquare: number[][] = JSON.parse(JSON.stringify(square));

        let isChanged: boolean = true;
        while (isChanged) {
            isChanged = false;

            cloneSquare.forEach((row, rowIndex) => {
                row.forEach((column, columnIndex) => {
                    if (column !== 0) {
                        return;
                    }

                    const verticalLine: number[] = cloneSquare.map(row => row[columnIndex]);

                    const littleSquareRows: number[] = rowIndex < Math.floor(cloneSquare.length / 2) ? [0, 1] : [2, 3];
                    const littleSquareColumns: number[] = columnIndex < Math.floor(row.length / 2) ? [0, 1] : [2, 3];
                    const littleSquare: number[] = littleSquareRows.flatMap(littleSquareRow => {
                        return littleSquareColumns.map(littleSquareColumn => {
                            return cloneSquare[littleSquareRow][littleSquareColumn];
                        });
                    });

                    const candidate: number[] = [1, 2, 3, 4]
                        .filter(num => ![...row, ...verticalLine, ...littleSquare].includes(num));
                    if (candidate.length !== 1) {
                        return;
                    }

                    cloneSquare[rowIndex][columnIndex] = candidate[0];
                    isChanged = true;
                });
            });
        }

        return cloneSquare;
    };
}

const lines: string[] = [line1, line2, line3, line4];
const square: number[][] = lines.map(line => line.split('').map(i => parseInt(i)));
const solvedSquare: number[][] = MiniSudoku.solve(square);

const results: string[] = solvedSquare.map(row => row.join(''));

// console.log('answer');
results.forEach(result => {
    console.log(result);
});

