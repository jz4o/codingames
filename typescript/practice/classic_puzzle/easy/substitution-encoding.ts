/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const rows: number = parseInt(readline());
const grid: string[][] = [];
for (let i = 0; i < rows; i++) {
    const row: string = readline();

    grid.push(row.split(' '));
}
const message: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const replaceMap: {[key: string]: string} = {};
grid.forEach((row, rowIndex) => {
    row.forEach((char, columnIndex) => {
        replaceMap[char] = `${rowIndex}${columnIndex}`;
    });
});

const result: string = message.split('').map(char => replaceMap[char]).join('');

// console.log('encode message');
console.log(result);
