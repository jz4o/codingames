/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs1: string[] = readline().split(' ');
const HI: number = parseInt(inputs1[0]);
const WI: number = parseInt(inputs1[1]);
const style: string = readline();
const howManyTriangles: number = parseInt(readline());
const triangleRows: number[][] = [];
for (let i = 0; i < howManyTriangles; i++) {
    const inputs2: string[] = readline().split(' ');
    const x1: number = parseInt(inputs2[0]);
    const y1: number = parseInt(inputs2[1]);
    const x2: number = parseInt(inputs2[2]);
    const y2: number = parseInt(inputs2[3]);
    const x3: number = parseInt(inputs2[4]);
    const y3: number = parseInt(inputs2[5]);
    triangleRows.push([x1, y1, x2, y2, x3, y3]);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

interface Point {
    y: number;
    x: number;
};

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    if (step > 0 && from <= to) {
        return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
    } else if (step < 0 && from >= to) {
        return [...Array(Math.floor((from - to + Math.abs(step)) / Math.abs(step))).keys()].map(i => from + i * step);
    } else {
        return [];
    }
};

const grid: number[][] = [...Array(HI).keys()].map(_ => Array(WI).fill(0));

triangleRows.forEach(([x1, y1, x2, y2, x3, y3]) => {
    const points: Point[] = [{ y: y1, x: x1 }, { y: y2, x: x2 }, { y: y3, x: x3 }];

    if (new Set(points.map(point => point.y)).size === 2) {
        const orderedPoints: Point[] = points.toSorted((a, b) => a.y !== b.y ? a.y - b.y : a.x - b.x);

        const horizontalY: number = orderedPoints[1].y;
        const [horizontalLeftPoint, horizontalRightPoint]: Point[] = orderedPoints.filter(point => point.y === horizontalY);
        const differentYPoint: Point = points.find(point => point.y !== horizontalY);

        const clinationLeft: number = differentYPoint.x === horizontalLeftPoint.x ? 0 : 1;
        const clinationRight: number = differentYPoint.x === horizontalRightPoint.x ? 0 : 1;

        const yStart: number = differentYPoint.y;
        const yStop: number = horizontalY;
        const yStep: number = differentYPoint.y < horizontalY ? 1 : -1;
        rangeArrayFromTo(yStart, yStop, yStep).forEach((y, index) => {
            if (y < 0 || HI <= y) {
                return;
            }

            const xStart: number = differentYPoint.x - clinationLeft * index;
            const xStop: number = differentYPoint.x + clinationRight * index;
            rangeArrayFromTo(xStart, xStop).forEach(x => {
                if (x < 0 || WI <= x) {
                    return;
                }

                grid[y][x]++;
            });
        });
    } else {
        const orderedPoints: Point[] = points.toSorted((a, b) => a.x !== b.x ? a.x - b.x : a.y - b.y);
        const verticalX: number = orderedPoints[1].x;
        const differentXPoint: Point = points.find(point => point.x !== verticalX);

        const xStart: number = differentXPoint.x;
        const xStop: number = verticalX;
        const xStep: number = differentXPoint.x < verticalX ? 1 : -1;
        rangeArrayFromTo(xStart, xStop, xStep).forEach((x, index) => {
            if (x < 0 || WI <= x) {
                return;
            }

            const yStart: number = differentXPoint.y - index;
            const yStop: number = differentXPoint.y + index;
            rangeArrayFromTo(yStart, yStop).forEach(y => {
                if (y < 0 || HI <= y) {
                    return;
                }

                grid[y][x]++;
            });
        });
    }
});

const results: string[] = grid.map(row => {
    return row.map(value => value % 2 === 0 ? '*' : ' ').join(style === 'expanded' ? ' ' : '');
});

// console.log('rectangleWithCarvings');
results.forEach(result => {
    console.log(result);
});
