/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const _d: number = parseInt(readline());
const n: number = parseInt(readline());
const pointRows: string[] = [];
for (let i = 0; i < n; i++) {
    const point: string = readline();
    pointRows.push(point);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const zip: <T, U>(a: T[], b: U[]) => [T, U][] = <T, U>(a: T[], b: U[]): [T, U][] => {
    const arraySize: number = Math.max(a.length, b.length);
    return [...Array(arraySize).keys()].map(index => {
        return [a[index], b[index]];
    });
};

interface Point {
    name: string;
    components: number[];
};

interface Vector {
    distance: number;
    text: string;
};

const points: Point[] = pointRows.map(pointRow => {
    const [, name, componentsStr]: string[] = pointRow.match(/(.*?)\((.*?)\)/);
    const components: number[] = componentsStr.split(',').map(componentStr => parseInt(componentStr));

    return { name, components };
});

const vectors: Vector[] = rangeArrayFromTo(0, n - 1).flatMap(leftIndex => {
    return rangeArrayFromTo(leftIndex + 1, n - 1).map(rightIndex => {
        const leftPoint: Point = points[leftIndex];
        const rightPoint: Point = points[rightIndex];

        const componentDistances: number[] = zip(leftPoint.components, rightPoint.components).map(([l, r]) => r - l);
        const distance: number = Math.sqrt(componentDistances.reduce((sum, d) => sum + (d ** 2), 0));

        const text: string = `${leftPoint.name}${rightPoint.name}(${componentDistances.join(',')})`;

        return { distance, text };
    });
});

const minDistance: number = Math.min(...vectors.map(vector => vector.distance));
const maxDistance: number = Math.max(...vectors.map(vector => vector.distance));

const minDistanceVector: Vector = vectors.find(vector => vector.distance === minDistance);
const maxDistanceVector: Vector = vectors.find(vector => vector.distance === maxDistance);

const results: string[] = [
    minDistanceVector.text,
    maxDistanceVector.text
];

// console.log('shortest_vector');
// console.log('longest_vector');
results.forEach(result => {
    console.log(result);
});

