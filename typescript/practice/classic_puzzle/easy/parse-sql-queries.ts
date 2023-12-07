/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const sqlQuery: string = readline();
const ROWS: number = parseInt(readline());
const tableHeader: string = readline();
const tableRows: string[] = [];
for (let i = 0; i < ROWS; i++) {
    const tableRow: string = readline();
    tableRows.push(tableRow);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const columns: string[] = tableHeader.split(' ');
const records: { [key: string]: string }[] = tableRows.map(tableRow => {
    const record: { [key: string]: string } = {};
    tableRow.split(' ').forEach((value, columnIndex) => {
        const column: string = columns[columnIndex];
        record[column] = value;
    });

    return record;
});

const sqlRegexp: string = '(SELECT)\\s(.*)\\s(FROM)\\s(.*)'
    .concat(sqlQuery.includes('WHERE') ? '\\s(WHERE)\\s(.*)' : '')
    .concat(sqlQuery.includes('ORDER BY') ? '\\s(ORDER BY)\\s(.*)' : '');

const [_, ...matched]: string[] = sqlQuery.match(new RegExp(sqlRegexp));
const query: { [key: string]: string } = {};
[...Array(matched.length / 2).keys()].forEach(i => {
    const key: string = matched[2 * i];
    const value: string = matched[2 * i + 1];

    query[key] = value;
});

let searchedRecords: { [key: string]: string }[] = records;

if ('WHERE' in query) {
    const [column, value]: string[] = query['WHERE'].split(' = ');
    searchedRecords = searchedRecords.filter(record => record[column] === value);
}

if ('ORDER BY' in query) {
    const [column, direction]: string[] = query['ORDER BY'].split(' ');

    if (searchedRecords.every(record => /^-?\d+\.?\d*$/.test(record[column]))) {
        searchedRecords.sort((a, b) => parseFloat(a[column]) - parseFloat(b[column]));
    } else {
        searchedRecords.sort((a, b) => a[column] > b[column] ? 1 : 0);
    }

    if (direction !== 'ASC') {
        searchedRecords.reverse();
    }
}

const selectColumns: string[] = query['SELECT'] === '*' ? columns : query['SELECT'].split(', ');

const resultHeader: string = selectColumns.join(' ');
const resultRecords: string[] = searchedRecords.map(record => {
    return selectColumns.map(column => record[column]).join(' ');
});

const results: string[] = [resultHeader].concat(resultRecords);

// console.log('outputTableWithColumnTitlesNoRowIndexes');
results.forEach(result => {
    console.log(result);
});
