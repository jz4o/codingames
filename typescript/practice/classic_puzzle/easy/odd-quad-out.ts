/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const sideSize: number = parseInt(readline());
const rows: string[] = [];
for (let i = 0; i < sideSize; i++) {
    const ROW: string = readline();
    rows.push(ROW);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const quadValues: number[] = Array(4).fill(0);
rows.forEach((row, rowIndex) => {
    row.split('').forEach((value, valueIndex) => {
        if (value === '.') {
            return;
        }

        const quadIndex: number = (rowIndex < sideSize / 2 ? 0 : 2) + (valueIndex < sideSize / 2 ? 0 : 1);
        quadValues[quadIndex] += parseInt(value);
    });
});

const [, standardValue]: number[] = [...quadValues].sort((a, b) => a - b);
const [oddValue]: number[] = quadValues.filter(value => value !== standardValue);
const oddQuad: number = quadValues.indexOf(oddValue) + 1;

const results: string[] = [
    `Quad-${oddQuad} is Odd-Quad-Out`,
    `It has value of ${oddValue}`,
    `Others have value of ${standardValue}`,
];

// console.log('the number of the Odd Quadrant Out');
// console.log('value of the Odd Quadrant Out');
// console.log('value of the other Quadrants');
results.forEach(result => {
    console.log(result);
});

