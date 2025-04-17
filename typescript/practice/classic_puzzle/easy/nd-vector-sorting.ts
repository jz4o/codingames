/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const D: number = parseInt(readline());
const N: number = parseInt(readline());
const inputs1: string[] = readline().split(' ');
const ords: number[] = [];
for (let i = 0; i < D; i++) {
    const ord: number = parseInt(inputs1[i]);
    ords.push(ord);
}
const coordRows: number[][] = [];
for (let i = 0; i < N; i++) {
    const inputs2: string[] = readline().split(' ');
    const coordRow: number[] = [];
    for (let j = 0; j < D; j++) {
        const coord: number = parseInt(inputs2[j]);
        coordRow.push(coord);
    }
    coordRows.push(coordRow);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

interface Vector {
    id: number;
    coordinates: number[];
};

const ordIndexes: number[] = ords.map(ord => ord - 1);

const vectors: Vector[] = coordRows.map((coordRow, index) => {
    return { id: index + 1, coordinates: coordRow };
});
vectors.sort((a, b) => {
    const ordIndex: number = ordIndexes.find(o => a.coordinates[o] !== b.coordinates[o]);
    return a.coordinates[ordIndex] - b.coordinates[ordIndex];
});

const result: string = vectors.map(vector => vector.id).join(' ');

// console.log('answer');
console.log(result);
