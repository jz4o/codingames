/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const pieces: string = readline();
const beforeLines: string[] = [];
for (let i = 0; i < 8; i++) {
    const sline: string = readline();
    beforeLines.push(sline);
}
const afterLines: string[] = [];
for (let i = 0; i < 8; i++) {
    const eline: string = readline();
    afterLines.push(eline);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Cell {
    y: number;
    x: number;
    v: string;
    lv: string;

    constructor(y: number, x: number, v: string) {
        this.y = y;
        this.x = x;
        this.v = v;
        this.lv = v.toLowerCase();
    }

    coordinates: () => string = (): string => {
        const row: number = 8 - this.y;
        const column: string = 'abcdefgh'.at(this.x);

        return `${column}${row}`;
    };
}

const lowerPieces: string = pieces.toLowerCase();

const diffBeforeCells: Cell[] = [];
const diffAfterCells: Cell[] = [];
beforeLines.forEach((line, lineIndex) => {
    line.split('').forEach((beforeValue, columnIndex) => {
        const afterValue: string = afterLines[lineIndex].at(columnIndex);
        if (beforeValue === afterValue) {
            return;
        }
        if ([beforeValue, afterValue].every(v => !lowerPieces.includes(v.toLowerCase()))) {
            return;
        }

        diffBeforeCells.push(new Cell(lineIndex, columnIndex, beforeValue));
        diffAfterCells.push(new Cell(lineIndex, columnIndex, afterValue));
    });
});
const isSimpleMove: boolean = [...diffBeforeCells, ...diffAfterCells].filter(cell => lowerPieces.includes(cell.lv)).length === 2;

let moveBeforeCell: Cell = null;
let moveAfterCell: Cell = null;
if (isSimpleMove) {
    moveBeforeCell = diffBeforeCells.find(cell => lowerPieces.includes(cell.lv));
    moveAfterCell = diffAfterCells.find(cell => cell.v === moveBeforeCell.v);
} else {
    moveAfterCell = diffAfterCells.find(cell => lowerPieces.includes(cell.lv));
    moveBeforeCell = diffBeforeCells.find(cell => cell.v === moveAfterCell.v);
}

const moveY: number = Math.abs(moveBeforeCell.y - moveAfterCell.y);
const moveX: number = Math.abs(moveBeforeCell.x - moveAfterCell.x);
const isKnight: boolean = [moveY, moveX].sort((a, b) => a- b).join(',') === '1,2';

const results: string[] = [];
results.push([moveBeforeCell.coordinates(), isSimpleMove ? '-' : 'x', moveAfterCell.coordinates()].join(''));
results.push(isKnight ? 'Knight' : 'Other');

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
