/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs1: string[] = readline().split(' ');
const a: number = parseInt(inputs1[0]);
const b: number = parseInt(inputs1[1]);
const objectLines: string[] = [];
for (let i = 0; i < a; i++) {
    const objectLine: string = readline();
    objectLines.push(objectLine);
}
const inputs2: string[] = readline().split(' ');
const c: number = parseInt(inputs2[0]);
const d: number = parseInt(inputs2[1]);
const gridLines: string[] = [];
for (let i = 0; i < c; i++) {
    const gridLine: string = readline();
    gridLines.push(gridLine);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Point = {
    y: number,
    x: number
};

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const grid: string[][] = gridLines.map(gridRow => gridRow.split(''));

const objectPartsPoints: Point[] = objectLines.flatMap((objectLine, lineIndex) => {
    return objectLine.split('').map((char, charIndex) => {
        if (char !== '*') {
            return null;
        }

        return { y: lineIndex, x: charIndex };
    });
}).filter(point => point);

const putablePoints: Point[] = rangeArrayFromTo(0, c - a).flatMap(lineIndex => {
    return rangeArrayFromTo(0, d - b).map(columnIndex => {
        const cantPutFlag: boolean = objectPartsPoints.some(point => {
            return grid[lineIndex + point.y][columnIndex + point.x] !== '.';
        });

        if (cantPutFlag) {
            return null;
        }

        return { y: lineIndex, x: columnIndex };
    });
}).filter(point => point);

const results: string[] = [];

results.push(putablePoints.length.toString());
if (putablePoints.length === 1) {
    const putablePoint: Point = putablePoints[0];

    const insertedGrid: string[][] = grid.map(row => [...row]);
    objectPartsPoints.forEach(objectPartsPoint => {
        const y: number = putablePoint.y + objectPartsPoint.y;
        const x: number = putablePoint.x + objectPartsPoint.x;

        insertedGrid[y][x] = '*';
    });

    results.push(...insertedGrid.map(row => row.join('')));
}

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
