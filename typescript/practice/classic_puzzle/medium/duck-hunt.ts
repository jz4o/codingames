/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const w: number = parseInt(readline());
const h: number = parseInt(readline());
const firstRows: string[] = [];
for (let i = 0; i < h; i++) {
    const row: string = readline();
    firstRows.push(row);
}
const secondRows: string[] = [];
for (let i = 0; i < h; i++) {
    const row: string = readline();
    secondRows.push(row);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

interface Coordinate {
    firstRowIndex: number;
    firstColumnIndex: number;
    secondRowIndex: number | null;
    secondColumnIndex: number | null;
};

class Duck {
    id: string;
    firstRowIndex: number;
    firstColumnIndex: number;
    secondRowIndex: number;
    secondColumnIndex: number;
    moveY: number;
    moveX: number;
    keepField: number;

    constructor(id: string, coordinate: Coordinate, h: number, w: number) {
        this.id = id;
        this.firstRowIndex = coordinate.firstRowIndex;
        this.firstColumnIndex = coordinate.firstColumnIndex;
        this.secondRowIndex = coordinate.secondRowIndex;
        this.secondColumnIndex = coordinate.secondColumnIndex;

        this.moveY = this.secondRowIndex - this.firstRowIndex;
        this.moveX = this.secondColumnIndex - this.firstColumnIndex;

        let keepFieldY: number;
        if (this.moveY > 0) {
            keepFieldY = Math.floor((h - this.firstRowIndex) / this.moveY);
        } else if (this.moveY < 0) {
            keepFieldY = Math.floor(this.firstRowIndex / Math.abs(this.moveY));
        }
        let keepFieldX: number;
        if (this.moveX > 0) {
            keepFieldX = Math.floor((w - this.firstColumnIndex) / this.moveX);
        } else if (this.moveX < 0) {
            keepFieldX = Math.floor(this.firstColumnIndex / Math.abs(this.moveX));
        }

        this.keepField = Math.min(...[keepFieldY, keepFieldX, Infinity].filter(n => n !== undefined));
    }

    distanceEdge: (turn: number, h: number, w: number) => number = (turn: number, h: number, w: number): number => {
        return Math.min(
            this.columnIndex(turn),
            w - this.columnIndex(turn),
            this.rowIndex(turn),
            h - this.rowIndex(turn)
        );
    };

    rowIndex: (turn: number) => number = (turn: number): number => {
        return this.firstRowIndex + (this.moveY * turn);
    };

    columnIndex: (turn: number) => number = (turn: number): number => {
        return this.firstColumnIndex + (this.moveX * turn);
    };
}

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const coordinates: { [key: string]: Coordinate } = {};
firstRows.forEach((row, rowIndex) => {
    row.split('').forEach((value, columnIndex) => {
        if (value === '.') {
            return;
        }

        coordinates[value] = {
            firstRowIndex: rowIndex,
            firstColumnIndex: columnIndex,
            secondRowIndex: null,
            secondColumnIndex: null
        };
    });
});
secondRows.forEach((row, rowIndex) => {
    row.split('').forEach((value, columnIndex) => {
        if (value === '.') {
            return;
        }

        coordinates[value].secondRowIndex = rowIndex;
        coordinates[value].secondColumnIndex = columnIndex;
    });
});

const ducks: Duck[] = Object.entries(coordinates).map(([id, coordinate]) => {
    return new Duck(id, coordinate, h, w);
}).sort((a, b) => a.keepField - b.keepField);

const results: string[] = [];
rangeArrayFromTo(2, ducks.length + 1).forEach(turn => {
    const targetKeepField: number = ducks.find(duck => turn <= duck.keepField)?.keepField;
    const targetDucks: Duck[] = ducks.filter(duck => duck.keepField === targetKeepField);
    const targetDuck: Duck = targetDucks.sort((a, b) => a.distanceEdge(turn, h, w) - b.distanceEdge(turn, h, w)).shift();
    if (!targetDuck) {
        return;
    }

    results.push(`${targetDuck.id} ${targetDuck.columnIndex(turn)} ${targetDuck.rowIndex(turn)}`);

    ducks.splice(ducks.indexOf(targetDuck), 1);
});

// console.log('ID x y');
results.forEach(result => {
    console.log(result);
});
