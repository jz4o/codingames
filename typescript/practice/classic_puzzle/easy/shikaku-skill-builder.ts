/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs1: string[] = readline().split(' ');
const w: number = parseInt(inputs1[0], 10);
const h: number = parseInt(inputs1[1], 10);
const grid: number[][] = [];
for (let i = 0; i < h; i++) {
    const inputs2: string[] = readline().split(' ');
    const row: number[] = [];
    for (let j = 0; j < w; j++) {
        const n: number = parseInt(inputs2[j], 10);
        row.push(n);
    }
    grid.push(row);
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

interface Cell {
    row: number;
    column: number;
    value: number;
};

interface CellResult {
    row: number;
    column: number;
    width: number;
    height: number;
};

const numberCells: Cell[] = grid.flatMap((row, rowIndex) => {
    return row.flatMap((value, columnIndex) => {
        return value === 0 ? [] : { row: rowIndex, column: columnIndex, value };
    });
});

const results: string[] = numberCells.flatMap(cell => {
    const cellResults: CellResult[] = rangeArray(1, cell.value).flatMap(width => {
        if (cell.value % width !== 0) {
            return [];
        }

        const height: number = Math.floor(cell.value / width);

        const minRowIndex: number = Math.max(cell.row - height + 1, 0);
        const maxRowIndex: number = Math.min(h - height, cell.row);
        const minColumnIndex: number = Math.max(cell.column - width + 1, 0);
        const maxColumnIndex: number = Math.min(w - width, cell.column);

        return rangeArray(minRowIndex, maxRowIndex).flatMap(rowIndex => {
            return rangeArray(minColumnIndex, maxColumnIndex).flatMap(columnIndex => {
                const values: number[] = grid.slice(rowIndex, rowIndex + height).flatMap(row => {
                    return row.slice(columnIndex, columnIndex + width);
                });
                const sumValues: number = values.reduce((sum, value) => sum + value, 0);
                if (sumValues !== cell.value) {
                    return [];
                }

                return { row: rowIndex, column: columnIndex, width, height };
            });
        });
    });
    if (cellResults.length === 0) {
        return [];
    }

    const cellResultStrings: string[] = cellResults
        .sort((a, b) => a.row !== b.row ? a.row - b.row : a.column - b.column)
        .map(cellResult => [cellResult.row, cellResult.column, cellResult.width, cellResult.height].join(' '));

    return [
        [cell.row, cell.column, cell.value].join(' '),
        ...cellResultStrings,
    ];
});

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
