/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const M: number = parseInt(readline());
const lines: string[] = [];
for (let i = 0; i < M; i++) {
    const LINE: string = readline();
    lines.push(LINE);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const grid: number[][] = lines.map(line => line.split(' ').map(s => parseInt(s)));

const tcN60: number = grid.reduce((sum, row) => {
    return sum + 10 + (row.reduce((sum, value) => sum + value) - 40) / 7;
}, 0) / grid.length;

let tcN8: number;
if (5 <= tcN60 && tcN60 <= 30) {
    const chirps: number[] = grid.flat();
    if (chirps.length % 2 === 1) {
        chirps.pop();
    }

    tcN8 = rangeArrayFromTo(0, chirps.length - 1, 2).reduce((tcN8, i) => {
        return tcN8 + chirps[i] + chirps[i + 1] + 5;
    }, 0) / (chirps.length / 2);
}

const results: string[] = [];
results.push(tcN60.toFixed(1));
if (tcN8 !== undefined) {
    results.push(tcN8.toFixed(1));
}

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
