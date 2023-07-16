/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const inputRows: number[][] = [];
for (let i = 0; i < n; i++) {
    var inputs: string[] = readline().split(' ');
    const row: number = parseInt(inputs[0]);
    const col: number = parseInt(inputs[1]);
    const isWhite: number = parseInt(inputs[2]);
    inputRows.push([row, col, isWhite]);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const results: number[] = inputRows.map(inputRow => {
    const [row, col, isWhite]: number[] = inputRow;

    const rowPatternSize: number = row - 7;
    const colPatternSize: number = col - 7;

    const patternSize: number = rowPatternSize * colPatternSize;

    const roundFunction: Function = isWhite == 0 ? Math.floor : Math.ceil;

    return roundFunction(patternSize / 2);
});

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
