/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const inputRows: [string, number, number][] = [];
for (let i = 0; i < N; i++) {
    const inputs: string[] = readline().split(' ');
    const name: string = inputs[0];
    const r: number = parseInt(inputs[1]);
    const c: number = parseInt(inputs[2]);
    inputRows.push([name, r, c]);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Apple = {
    name: string,
    row: number,
    column: number,
    columnCondition: number
};

const apples: Apple[] = inputRows.map(([name, r, c]) => ({ name: name, row: r, column: c, columnCondition: null}));

const appleRows: number[] = Array.from(new Set(apples.map(apple => apple.row))).sort((a, b) => a - b);
apples.forEach(apple => apple.columnCondition = appleRows.indexOf(apple.row) % 2 === 0 ? apple.column : -apple.column);

const sortedApples: Apple[] = apples.sort((a, b) => {
    if (a.row !== b.row) {
        return a.row - b.row;
    }

    return a.columnCondition - b.columnCondition;
});

const result: string = sortedApples.map(apple => apple.name).join(',');

// console.log('UNKNOWN');
console.log(result);
