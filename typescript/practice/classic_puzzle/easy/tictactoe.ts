/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const lines: string[] = [];
for (let i = 0; i < 3; i++) {
    const line: string = readline();
    lines.push(line);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const WINNING_PATTERN: string = '.OO';
const INDEXES: number[] = [...Array(3).keys()];

const grid: string[][] = lines.map(line => line.split(''));

let isMoved: boolean = false;

// check row
grid.some((row, index) => {
    if ([...row].sort().join('') === WINNING_PATTERN) {
        grid[index] = ['O', 'O', 'O'];

        isMoved = true;
    }

    return isMoved;
});

// check column
if (!isMoved) {
    INDEXES.some(columnIndex => {
        if (INDEXES.map(rowIndex => grid[rowIndex][columnIndex]).sort().join('') === WINNING_PATTERN) {
            INDEXES.forEach(rowIndex => {
                grid[rowIndex][columnIndex] = 'O';
            });

            isMoved = true;
        }

        return isMoved;
    });
}

// check diagonal
if (!isMoved && INDEXES.map(index => grid[index][index]).sort().join('') === WINNING_PATTERN) {
    INDEXES.forEach(index => {
        grid[index][index] = 'O';
    });

    isMoved = true;
}
if (!isMoved && INDEXES.map(index => grid[index][2 - index]).sort().join('') === WINNING_PATTERN) {
    INDEXES.forEach(index => {
        grid[index][2 - index] = 'O';
    });

    isMoved = true;
}

const results: string[] = isMoved ? grid.map(row => row.join('')) : ['false'];

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
