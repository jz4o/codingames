/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const h: number = parseInt(readline());
const w: number = parseInt(readline());
const ss: string[] = [];
for (let i = 0; i < h; i++) {
    const s: string = readline();
    ss.push(s);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

interface Light {
    rowIndex: number;
    columnIndex: number;
    value: number;
};

const KIND_OF_NUMBER: number = 36;

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const numberGrid: number[][] = ss.map(s => {
    return s.replace(/\./g, '0').split('').map(v => parseInt(v, KIND_OF_NUMBER));
});

const lights: Light[] = numberGrid.flatMap((row, rowIndex) => {
    return row.map((value, columnIndex) => {
        return value !== 0 ? {rowIndex, columnIndex, value} : null;
    }).filter(light => light !== null);
});

lights.forEach(light => {
    const rowDistanceRange: number[] = rangeArrayFromTo(-Math.min(light.rowIndex, light.value), Math.min(h - light.rowIndex - 1, light.value));
    const columnDistanceRange: number[] = rangeArrayFromTo(-Math.min(light.columnIndex, light.value), Math.min(w - light.columnIndex - 1, light.value));

    rowDistanceRange.forEach(rowDistance => {
        columnDistanceRange.forEach(columnDistance => {
            if (rowDistance === 0 && columnDistance === 0) {
                return;
            }

            const distance: number = Math.sqrt(Math.abs(rowDistance) ** 2 + Math.abs(columnDistance) ** 2);
            const brightness: number = Math.max(Math.round(light.value - distance), 0);
            numberGrid[light.rowIndex + rowDistance][light.columnIndex + columnDistance] += brightness;
        });
    });
});

const results: string[] = numberGrid.map(row => {
    return row.map(value => Math.min(value, KIND_OF_NUMBER - 1).toString(KIND_OF_NUMBER)).join('').toUpperCase();
});

// console.log('Bobville');
results.forEach(result => {
    console.log(result);
});
