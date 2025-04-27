/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const h: number = parseInt(readline());
const w: number = parseInt(readline());
const n: number = parseInt(readline());
const passengers: string[] = [];
for (let i = 0; i < n; i++) {
    const passenger: string = readline();
    passengers.push(passenger);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const sheetNames: { [key: string]: string } = {};
passengers.forEach(passenger => {
    const [name, sheet]: string[] = passenger.split(',');
    sheetNames[sheet] = name;
});

// row: back to front
// column: outer to inner
const sheetColumns: string[] = 'ABCDEFGH'.split('');
const centerW: number = Math.floor(w / 2);
const leftSheetNames: string[][] = rangeArrayFromTo(1, h).reverse().map(row => {
    return sheetColumns
        .slice(0, centerW)
        .filter(column => `${row}${column}` in sheetNames)
        .map(column => sheetNames[`${row}${column}`]);
});
const rightSheetNames: string[][] = rangeArrayFromTo(1, h).reverse().map(row => {
    return sheetColumns
        .slice(centerW, w)
        .reverse()
        .filter(column => `${row}${column}` in sheetNames)
        .map(column => sheetNames[`${row}${column}`]);
});

const results: string[] = [...Array(w).keys()].map(i => {
    const targetSheetNames: string[][] = i % 2 === 0 ? leftSheetNames : rightSheetNames;
    const names: string[] = targetSheetNames
        .filter(targetSheetName => targetSheetName.length > 0)
        .map(targetSheetName => targetSheetName.shift());

    if (names.length === 0) {
        return null;
    }

    return `Now boarding: ${names.join(',')}`;
}).filter(result => result !== null);

// console.log('Now boarding: Tinky Winky,Dipsy,La La,Po');
results.forEach(result => {
    console.log(result);
});
