/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const h: number = parseInt(readline());
const rows: Array<string> = [];
for (let i = 0; i < h; i++) {
    const row: string = readline();
    rows.push(row);
}
const results: Array<string> = [];
for (let i = 0; i < h; i++) {

    // Write an answer using console.log()
    // To debug: console.error('Debug messages...');

    const row: string = rows[i];
    const result: string = row
        .split(' ')
        .map((length, index) => (index % 2 === 0 ? '.' : 'O').repeat(parseInt(length)))
        .join('');

    // console.log('answer');
    results.push(result);
}

if ([...new Set(results.map(result => result.length))].length > 1) {
    console.log('INVALID');
} else {
    results.forEach(result => {
        console.log(result);
    });
}
