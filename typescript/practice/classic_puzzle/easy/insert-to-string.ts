/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const s: string = readline();
const changeCount: number = parseInt(readline());
const rawChanges: string[] = [];
for (let i = 0; i < changeCount; i++) {
    const rawChange: string = readline();
    rawChanges.push(rawChange);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Change = {
    rowIndex: number,
    columnIndex: number,
    value: string
};

const changes: Change[] = rawChanges.map(rawChange => {
    const [rowIndexStr, columnIndexStr, value]: string[] = rawChange.split('|');
    const rowIndex: number = parseInt(rowIndexStr);
    const columnIndex: number = parseInt(columnIndexStr);

    return { rowIndex, columnIndex, value };
});

changes.sort((a, b) => {
    if (a.rowIndex !== b.rowIndex) {
        return b.rowIndex - a.rowIndex;
    }

    return b.columnIndex - a.columnIndex;
});

const sRows: string[] = s.split('\\n');
changes.forEach(change => {
    const sRow: string = sRows[change.rowIndex];

    const before: string = sRow.slice(0, change.columnIndex);
    const after: string = sRow.slice(change.columnIndex);
    const { value }: Change = change;

    sRows[change.rowIndex] = `${before}${value}${after}`;
});

const results: string[] = sRows.flatMap(sRow => sRow.split('\\n'));

// console.log('answer');
results.forEach(result => {
    console.log(result);
});

