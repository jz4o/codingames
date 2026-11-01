/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs1: string[] = readline().split(' ');
const w: number = parseInt(inputs1[0], 10);
const h: number = parseInt(inputs1[1], 10);
const grid: number[][] = [];
for (let i = 0; i < h; i++) {
    const inputs2: string[] = readline().split(' ');
    const row: number[] = [];
    for (let j = 0; j < w; j++) {
        const mountainHeight: number = parseInt(inputs2[j], 10);
        row.push(mountainHeight);
    }
    grid.push(row);
}
const inputs3: string[] = readline().split(' ');
const a: number = parseInt(inputs3[0], 10);
const b: number = parseInt(inputs3[1], 10);
const t: number = parseInt(readline(), 10);

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const eachCons: <T>(targetArray: T[], n: number) => T[][] = <T>(targetArray: T[], n: number): T[][] => {
    if (targetArray.length < n) {
        return [];
    }

    return [...Array(targetArray.length - n + 1).keys()].map(i => {
        return targetArray.slice(i, i + n);
    });
};

const getSubGrids: (grid: number[][], height: number, width: number) => number[][] = (grid: number[][], height: number, width: number): number[][] => {
    const columnIndexes: number[] = [...Array(grid[0].length).keys()];

    const subGrids: number[][] = [];
    eachCons(grid, height).forEach(rows => {
        eachCons(columnIndexes, width).forEach(columns => {
            const subGrid: number[] = rows.flatMap(row => {
                return columns.map(column => row[column]);
            });
            subGrids.push(subGrid);
        });
    });

    return subGrids;
};

const subGrids: number[][] = getSubGrids(grid, a, b);
if (a !== b) {
    subGrids.push(...getSubGrids(grid, b, a));
}

const shots: number[] = subGrids.map(subGrid => {
    const minValue: number = Math.min(...subGrid);
    const sumValue: number = subGrid.reduce((sum, v) => sum + v - minValue, 0);

    return sumValue;
});
const minShot: number = Math.min(...shots);

const result: string = minShot <= t ? minShot.toString() : 'Not Possible';

// console.log('Save the starship');
console.log(result);
