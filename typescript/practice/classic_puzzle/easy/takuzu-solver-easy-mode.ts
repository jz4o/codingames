/**
 * Takuzu Solver (Easy mode)
 * No row or column may contain a sequence of three or more repeating digits
 * e.g. 1 1 0 is valid but 1 1 1 is invalid
 **/

const n: number = parseInt(readline(), 10);
const rows: string[] = [];
for (let i = 0; i < n; i++) {
    const row: string = readline();
    rows.push(row);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const transpose: <T>(array: T[][]) => T[][] = <T>(array: T[][]): T[][] => {
    return array[0].map((_value, index) => array.map(row => row[index]));
};

const replaceArray: [RegExp, string][] = [
    [/\.00/g, '100'],
    [/0\.0/g, '010'],
    [/00\./g, '001'],
    [/\.11/g, '011'],
    [/1\.1/g, '101'],
    [/11\./g, '110'],
];

let replacedRows: string[] = [...rows];
while (replacedRows.join('').includes('.')) {
    replacedRows = replacedRows.map(row => {
        return replaceArray.reduce((replacedRow, [from, to]) => {
            return replacedRow.replace(from, to);
        }, row);
    });

    replacedRows = transpose(replacedRows.map(row => row.split(''))).map(row => row.join(''));
    replacedRows = replacedRows.map(row => {
        return replaceArray.reduce((replacedRow, [from, to]) => {
            return replacedRow.replace(from, to);
        }, row);
    });
    replacedRows = transpose(replacedRows.map(row => row.split(''))).map(row => row.join(''));
}

const results: string[] = [...replacedRows];

// console.log('Completed board');
results.forEach(result => {
    console.log(result);
});
