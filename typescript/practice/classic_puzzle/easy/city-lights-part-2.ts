/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const l: number = parseInt(readline(), 10);
const w: number = parseInt(readline(), 10);
const d: number = parseInt(readline(), 10);
const n: number = parseInt(readline(), 10);
const inputRows: string[] = [];
for (let i = 0; i < n; i++) {
    const s: string = readline();
    inputRows.push(s);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArray: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    if (step > 0 && from <= to) {
        return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
    } else if (step < 0 && from >= to) {
        return [...Array(Math.floor((from - to + Math.abs(step)) / Math.abs(step))).keys()].map(i => from + i * step);
    } else {
        return [];
    }
};

interface Light {
    depthIndex: number;
    rowIndex: number;
    columnIndex: number;
    value: number;
};

const KIND_OF_NUMBER: number = 36;

const cube: number[][][] = [];
const tempRows: string[] = [...inputRows];
while (tempRows.length > 0) {
    const rows: string[] = tempRows.splice(0, w);

    const grid: number[][] = rows.map(row => {
        return row.split('').map(v => v === '.' ? 0 : parseInt(v, KIND_OF_NUMBER));
    });
    cube.push(grid);

    tempRows.shift();
}

const lights: Light[] = [];
cube.forEach((grid, depth) => {
    grid.forEach((row, rowIndex) => {
        row.forEach((value, columnIndex) => {
            if (value === 0) {
                return;
            }

            lights.push({depthIndex: depth, rowIndex, columnIndex, value});
        });
    });
});

lights.forEach(light => {
    const depthDistanceRange: number[] = rangeArray(Math.min(light.depthIndex, light.value) * -1, Math.min(d - light.depthIndex - 1, light.value));
    const rowDistanceRange: number[] = rangeArray(Math.min(light.rowIndex, light.value) * -1, Math.min(w - light.rowIndex - 1, light.value));
    const columnDistanceRange: number[] = rangeArray(Math.min(light.columnIndex, light.value) * -1, Math.min(l - light.columnIndex - 1, light.value));

    depthDistanceRange.forEach(depthDistance => {
        rowDistanceRange.forEach(rowDistance => {
            columnDistanceRange.forEach(columnDistance => {
                if ([depthDistance, rowDistance, columnDistance].every(distance => distance === 0)) {
                    return;
                }

                const distance: number = Math.round(Math.sqrt(Math.abs(depthDistance)**2 + Math.abs(rowDistance)**2 + Math.abs(columnDistance)**2));
                const brightness: number = Math.max(light.value - distance, 0);

                const targetDepthIndex: number = light.depthIndex + depthDistance;
                const targetRowIndex: number = light.rowIndex + rowDistance;
                const targetColumnIndex: number = light.columnIndex + columnDistance;
                cube[targetDepthIndex][targetRowIndex][targetColumnIndex] += brightness;
            });
        });
    });
});

const results: string[] = [];
cube.forEach(grid => {
    grid.forEach(row => {
        const result: string = row.map(v => Math.min(v, KIND_OF_NUMBER - 1).toString(KIND_OF_NUMBER)).join('').toUpperCase();
        results.push(result);
    });
    results.push('');
});
results.pop();

// console.log('Bobville');
results.forEach(result => {
    console.log(result);
});
