/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const w: number = parseInt(readline());
const h: number = parseInt(readline());
const lines: string[] = [];
for (let i = 0; i < h; i++) {
    const line: string = readline();
    lines.push(line);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo: (from: number, to: number) => number[] = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
};

type Position = {
    rowIndex: number,
    columnIndex: number
};

lines.unshift('.'.repeat(w));
lines.push('.'.repeat(w));
const grid: number[][] = lines.map(line => {
    return `.${line}.`
        .replace(/\./g, '0')
        .replace(/x/g, '9')
        .split('')
        .map(s => parseInt(s));
});

rangeArrayFromTo(1, h).forEach(rowIndex => {
    rangeArrayFromTo(1, w).forEach(columnIndex => {
        if (grid[rowIndex][columnIndex] !== 9) {
            return;
        }

        const aroundPositions: Position[] = [
            { rowIndex: rowIndex - 1, columnIndex: columnIndex - 1 },
            { rowIndex: rowIndex - 1, columnIndex: columnIndex },
            { rowIndex: rowIndex - 1, columnIndex: columnIndex + 1 },
            { rowIndex: rowIndex, columnIndex: columnIndex - 1 },
            { rowIndex: rowIndex, columnIndex: columnIndex + 1 },
            { rowIndex: rowIndex + 1, columnIndex: columnIndex - 1 },
            { rowIndex: rowIndex + 1, columnIndex: columnIndex },
            { rowIndex: rowIndex + 1, columnIndex: columnIndex + 1 }
        ];

        aroundPositions.forEach(position => {
            if (grid[position.rowIndex][position.columnIndex] !== 9) {
                grid[position.rowIndex][position.columnIndex]++;
            }
        });
    });
});

const results: string[] = grid.slice(1, -1).map(row => {
    return row
        .slice(1, -1)
        .join('')
        .replace(/0|9/g, '.');
});

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
