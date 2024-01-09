/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs1: string[] = readline().split(' ');
const width: number = parseInt(inputs1[0]);
const height: number = parseInt(inputs1[1]);
const cells: number[] = [];
for (let i = 0; i < height; i++) {
    const inputs2: string[] = readline().split(' ');
    for (let j = 0; j < width; j++) {
        const cell: number = parseInt(inputs2[j]);
        cells.push(cell);
    }
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const grid: number[][] = [...Array(height).keys()]
    .map(h => cells.slice(h * width, (h + 1) * width));

const rectangleSizes: number[] = [];
grid.forEach((row, rowIndex) => {
    row.forEach((cell, columnIndex) => {
        if (cell !== 1) {
            return;
        }

        rangeArrayFromTo(1, height - rowIndex).forEach(h => {
            const hRows: number[][] = grid.slice(rowIndex, rowIndex + h);

            rangeArrayFromTo(1, width - columnIndex).forEach(w => {
                const binaryRows: number[][] = hRows.map(hRow => hRow.slice(columnIndex, columnIndex + w));
                if (binaryRows.every(binaryRow => !binaryRow.includes(0))) {
                    const rectangleSize: number = binaryRows.flat().length;
                    rectangleSizes.push(rectangleSize);
                }
            });
        });
    });
});

const result: string = Math.max(...rectangleSizes).toString();

// console.log('answer');
console.log(result);
