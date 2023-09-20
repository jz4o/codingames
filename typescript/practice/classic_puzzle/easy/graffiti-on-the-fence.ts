/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const L: number = parseInt(readline());
const N: number = parseInt(readline());
const inputRows: number[][] = [];
for (let i = 0; i < N; i++) {
    const inputs: string[] = readline().split(' ');
    const st: number = parseInt(inputs[0]);
    const ed: number = parseInt(inputs[1]);

    inputRows.push([st, ed]);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Report = {
    st: number,
    ed: number
};

const reports: Report[] = inputRows.map(inputRow => {
    const [st, ed]: number[] = inputRow;

    return { st, ed };
});
reports.sort((a, b) => a.st - b.st);

const results: string[] = [];

let position: number = 0;
reports.forEach(report => {
    if (position < report.st) {
        results.push(`${position} ${report.st}`);
    }

    if (position < report.ed) {
        position = report.ed;
    }
});

if (position < L) {
    results.push(`${position} ${L}`);
}

if (results.length <= 0) {
    results.push('All painted');
}

// console.log('answer');
results.forEach(result => {
    console.log(result);
})
