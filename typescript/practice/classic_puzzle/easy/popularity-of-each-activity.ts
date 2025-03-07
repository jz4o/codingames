/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const height: number = parseInt(readline());
const rows: string[] = [];
for (let i = 0; i < height; i++) {
    const ROW: string = readline();
    rows.push(ROW);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const splitColumnIndexes: number[] = rows[0].split('').map((value, index) => {
    return value === ':' ? index : null;
}).filter(index => index !== null);
const splitRowIndexes: number[] = rows.map((row, index) => {
    return row.startsWith('-') ? index : null;
}).filter(index => index !== null);

const attendeesGrid: number[][] = [...Array(3).keys()].map(() => Array(3).fill(0));
rows.forEach((row, rowIndex) => {
    const gridRowIndexes = splitRowIndexes.map((splitRowIndex, index) => {
        return rowIndex < splitRowIndex ? index : null;
    }).filter(index => index !== null);
    const gridRowIndex: number = gridRowIndexes.length > 0 ? gridRowIndexes[0] : 2;

    row.split('').forEach((value, columnIndex) => {
        if (value !== '*') {
            return;
        }

        const gridColumnIndexes: number[] = splitColumnIndexes.map((splitColumnIndex, index) => {
            return columnIndex < splitColumnIndex ? index : null;
        }).filter(index => index !== null);
        const gridColumnIndex: number = gridColumnIndexes.length > 0 ? gridColumnIndexes[0] : 2;

        attendeesGrid[gridRowIndex][gridColumnIndex]++;
    });
});

const totalAttendees: number = rows.join('').match(/\*/g).length;
const attendeesPercentageRows: string[] = attendeesGrid.map(attendeesRow => {
    const attendeesPercentages: string[] = attendeesRow.map(attendees => {
        const percentage: number = Math.round(attendees / totalAttendees * 100);
        const attendeesPercentage: string = `${percentage.toString().padStart(3, '_')}%`;

        return attendeesPercentage;
    });

    return attendeesPercentages.join(' ');
});

const results: string[] = [
    `${totalAttendees} attendees`,
    ...attendeesPercentageRows
];

// console.log('total, and popularity of each');
results.forEach(result => {
    console.log(result);
});
