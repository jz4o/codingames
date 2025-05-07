/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const cornerInputs: [number, number][] = [];
for (let i = 0; i < N; i++) {
    const inputs: string[] = readline().split(' ');
    const x: number = parseInt(inputs[0]);
    const y: number = parseInt(inputs[1]);
    cornerInputs.push([x, y]);
}
const M: number = parseInt(readline());
const shotInputs: [number, number][] = [];
for (let i = 0; i < M; i++) {
    const inputs: string[] = readline().split(' ');
    const x: number = parseInt(inputs[0]);
    const y: number = parseInt(inputs[1]);
    shotInputs.push([x, y]);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Point {
    x: number;
    y: number;

    constructor(x: number, y: number) {
        this.x = x;
        this.y = y;
    }

    equals: (other: Point) => boolean = (other: Point): boolean => {
        return this.x === other.x && this.y === other.y;
    };
}

const zip: <T, U>(a: T[], b: U[]) => [T, U][] = <T, U>(a: T[], b: U[]): [T, U][] => {
    const arraySize: number = Math.max(a.length, b.length);
    return [...Array(arraySize).keys()].map(index => {
        return [a[index], b[index]];
    });
};

const corners: Point[] = cornerInputs.map(([x, y]) => new Point(x, y));
corners.push(corners[0]);

const shots: Point[] = shotInputs.map(([x, y]) => new Point(x, y));

const results: string[] = shots.map(shot => {
    const bothSideCornerArrays: [Point, Point][] = [];

    corners.forEach(corner => {
        if (corner.x !== shot.x) {
            return;
        }

        bothSideCornerArrays.push([corner, corner]);
    });

    zip(corners.slice(0, -1), corners.slice(1)).forEach(([leftCorner, rightCorner]) => {
        const minCornerX: number = Math.min(leftCorner.x, rightCorner.x);
        const maxCornerX: number = Math.max(leftCorner.x, rightCorner.x);

        if (shot.x <= minCornerX || maxCornerX <= shot.x) {
            return;
        }

        if (leftCorner.x < rightCorner.x) {
            bothSideCornerArrays.push([leftCorner, rightCorner]);
        } else {
            bothSideCornerArrays.push([rightCorner, leftCorner]);
        }
    });

    const uniqBothSideCornerArrays: [Point, Point][] = [];
    bothSideCornerArrays.forEach((cs) => {
        const isExists = uniqBothSideCornerArrays.some(array => {
            return zip(array, cs).every(([a, b]) => a.equals(b));
        });
        if (isExists) {
            return;
        }

        uniqBothSideCornerArrays.push(cs);
    });

    if (uniqBothSideCornerArrays.length === 0) {
        return 'miss';
    } else if (uniqBothSideCornerArrays.length === 1) {
        const corner: Point = uniqBothSideCornerArrays.flat().at(-1);

        return shot.y === corner.y ? 'hit' : 'miss';
    } else if (uniqBothSideCornerArrays.length === 2) {
        const ys: number[] = uniqBothSideCornerArrays.map(([leftCorner, rightCorner]) => {
            const cornersDiffX: number = Math.abs(rightCorner.x - leftCorner.x);
            const cornersDiffY: number = rightCorner.y - leftCorner.y;

            if (cornersDiffX === 0) {
                return leftCorner.y;
            } else {
                const inclination: number = cornersDiffY / cornersDiffX;

                return leftCorner.y + (inclination * (shot.x - leftCorner.x));
            }
        });

        return Math.min(...ys) <= shot.y && shot.y <= Math.max(...ys) ? 'hit' : 'miss';
    } else {
        return null;
    }
});

// console.log('hit_or_miss');
results.forEach(result => {
    console.log(result);
});
