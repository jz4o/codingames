/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs1: string[] = readline().split(' ');
const M: number = parseInt(inputs1[0]);
const N: number = parseInt(inputs1[1]);
const t: number = parseInt(readline());
const inputs2: string[] = readline().split(' ');
const choices: number[] = [];
for (let i = 0; i < t; i++) {
    const choice: number = parseInt(inputs2[i]);
    choices.push(choice);
}
const grid: number[][] = [...Array(N).keys()].map(() => Array(M).fill(0));
[...Array(N).keys()].forEach(rowIndex => {
    grid[rowIndex][0]++;
    grid[rowIndex][M - 1]++;
});
[...Array(M).keys()].forEach(columnIndex => {
    grid[0][columnIndex]++;
    grid[N - 1][columnIndex]++;
});
for (let i = 0; i < t; i++) {

    // Write an answer using console.log()
    // To debug: console.error('Debug messages...');

    const choice: number = choices[i];
    const choiceIndex: number = choice - 1;

    grid[choiceIndex].pop();
    const eatIndex: number = grid[choiceIndex].length;

    if (eatIndex !== 0) {
        grid[choiceIndex][eatIndex - 1]++;
    }
    if (choiceIndex !== 0 && eatIndex < grid[choiceIndex - 1].length) {
        grid[choiceIndex - 1][eatIndex]++;
    }
    if (choiceIndex + 1 !== M && eatIndex < grid[choiceIndex + 1].length) {
        grid[choiceIndex + 1][eatIndex]++;
    }

    const result: string = grid.flat().reduce((sum, elm) => sum + elm, 0).toString();

    // console.log('perimeter');
    console.log(result);
}
