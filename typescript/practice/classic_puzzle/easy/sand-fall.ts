/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const W: number = parseInt(inputs[0]);
const H: number = parseInt(inputs[1]);
const N: number = parseInt(readline());
const inputRows: [string, number][] = [];
for (let i = 0; i < N; i++) {
    const inputs: string[] = readline().split(' ');
    const S: string = inputs[0];
    const P: number = parseInt(inputs[1]);
    inputRows.push([S, P]);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const transpose: <T>(array: T[][]) => T[][] = <T>(array: T[][]): T[][] => {
    return array[0].map((_value, index) => array.map(row => row[index]));
};

const clockwiseGrid: string[][] = [...Array(W).keys()].map(() => ['-']);
clockwiseGrid.unshift(['+', ...Array(H).fill('|')]);
clockwiseGrid.push(['+', ...Array(H).fill('|')]);

inputRows.forEach(([character, point]) => {
    const firstFallDirection: number = /[a-z]/.test(character) ? 1 : -1;

    let targetPoint: number = point + 1;
    let fallFlag: boolean = true;
    while (fallFlag) {
        fallFlag = false;

        const targetRow: string[] = clockwiseGrid[targetPoint];
        const firstFallRow: string[] = clockwiseGrid[targetPoint + firstFallDirection];
        const secondFallRow: string[] = clockwiseGrid[targetPoint - firstFallDirection];

        if (firstFallRow.length < targetRow.length) {
            targetPoint += firstFallDirection;
            fallFlag = true;
        } else if (secondFallRow.length < targetRow.length) {
            targetPoint -= firstFallDirection;
            fallFlag = true;
        }
    }

    clockwiseGrid[targetPoint].push(character);
});

const transposedGrid: string[][] = clockwiseGrid.map(row => {
    return [...row, ...Array(H - row.length + 1).fill(' ')].reverse();
});
const grid: string[][] = transpose(transposedGrid);

const results: string[] = grid.map(row => row.join(''));

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
