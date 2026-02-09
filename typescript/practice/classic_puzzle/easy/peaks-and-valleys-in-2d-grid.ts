/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const h: number = parseInt(readline());
const lines: string[] = [];
for (let i = 0; i < h; i++) {
    const line: string = readline();
    lines.push(line);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Point {
    y: number;
    x: number;

    constructor(y: number, x: number) {
        this.y = y;
        this.x = x;
    }

    toString() {
        return `(${this.x}, ${this.y})`;
    }
}

const grid: (null|number)[][] = lines.map(line => {
    return [null, ...line.split(' ').map(v => parseInt(v)), null];
});
grid.unshift(grid[0].map(() => null));
grid.push(grid[0].map(() => null));

const peakPoints: Point[] = [];
const valleyPoints: Point[] = [];
grid.forEach((row, rowIndex) => {
    row.forEach((value, columnIndex) => {
        if (value === null) {
            return;
        }

        const aroundValues: number[] = grid.slice(rowIndex - 1, rowIndex + 2).flatMap(r => {
            return r.slice(columnIndex - 1, columnIndex + 2).filter(v => v !== null);
        });

        const valueCount: number = aroundValues.filter(v => v === value).length;
        if (valueCount !== 1) {
            return;
        }

        const point: Point = new Point(rowIndex - 1, columnIndex - 1);

        if (Math.max(...aroundValues) === value) {
            peakPoints.push(point);
        }

        if (Math.min(...aroundValues) === value) {
            valleyPoints.push(point);
        }
    });
});

const results: string[] = [
    peakPoints.length > 0 ? peakPoints.map(point => point.toString()).join(', ') : 'NONE',
    valleyPoints.length > 0 ? valleyPoints.map(point => point.toString()).join(', ') : 'NONE',
];

// console.log('Peak Coordinates or None');
// console.log('Valley Coordinates or None');
results.forEach(result => {
    console.log(result);
});
