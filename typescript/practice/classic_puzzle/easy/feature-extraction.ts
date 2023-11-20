/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs1: string[] = readline().split(' ');
const r: number = parseInt(inputs1[0]);
const c: number = parseInt(inputs1[1]);
const pixels: number[] = [];
for (let i = 0; i < r; i++) {
    const inputs2: string[] = readline().split(' ');
    for (let j = 0; j < c; j++) {
        const pixel: number = parseInt(inputs2[j]);
        pixels.push(pixel);
    }
}
const inputs3: string[] = readline().split(' ');
const m: number = parseInt(inputs3[0]);
const n: number = parseInt(inputs3[1]);
const weights: number[] = [];
for (let i = 0; i < m; i++) {
    const inputs4: string[] = readline().split(' ');
    for (let j = 0; j < n; j++) {
        const weight: number = parseInt(inputs4[j]);
        weights.push(weight);
    }
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

const pixelGrid: number[][] = [...Array(r).keys()].map(i => pixels.slice(i * c, (i + 1) * c));

const convolutionGrid: string[][] = [...Array(r - m + 1).keys()].map(h => {
    const convolutionRow: string[] = [...Array(c - n + 1).keys()].map(w => {
        const pixelValues: number[] = rangeArrayFromTo(h, h + m - 1).flatMap(ph => {
            return rangeArrayFromTo(w, w + n - 1).map(pw => pixelGrid[ph][pw]);
        });

        const convolutionValue: number = zip(pixelValues, weights).reduce((sum, [pixel, weight]) => sum + (pixel * weight), 0);

        return convolutionValue.toString();
    });

    return convolutionRow;
});

const results: string[] = convolutionGrid.map(convolutionRow => convolutionRow.join(' '));

// console.log('output matrix');
results.forEach(result => {
    console.log(result);
});
