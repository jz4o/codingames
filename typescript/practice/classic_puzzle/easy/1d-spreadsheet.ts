/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

class SpreadSheet {
    cells: Cell[];

    constructor() {
        this.cells = [];
    };

    addCell(cell: Cell) {
        this.cells.push(cell);
    }

    getValue(cellIndex: number) {
        return this.cells[cellIndex].value || this.calcValue(cellIndex);
    }

    getArgValue(arg: string) {
        return arg.includes('$') ? this.getValue(parseInt(arg.slice(1))) : parseInt(arg);
    }

    calcValue(cellIndex: number) {
        const cell: Cell = this.cells[cellIndex];
        const arg1: number = this.getArgValue(cell.arg1);
        const arg2: number = this.getArgValue(cell.arg2);
        switch (cell.operation) {
            case 'VALUE':
                cell.value = arg1;
                break;
            case 'ADD':
                cell.value = arg1 + arg2;
                break;
            case 'SUB':
                cell.value = arg1 - arg2;
                break;
            case 'MULT':
                // plus zero is for remove minus zero.
                cell.value = arg1 * arg2 + 0;
                break;
        }

        return cell.value;
    }
}

interface Cell {
    operation: string;
    arg1: any;         // string or number.
    arg2: any;         // string or number.
    value: number;
}

const spreadSheet: SpreadSheet = new SpreadSheet();

const N: number = parseInt(readline());
for (let i = 0; i < N; i++) {
    var inputs: string[] = readline().split(' ');
    const operation: string = inputs[0];
    const arg1: string = inputs[1];
    const arg2: string = inputs[2];

    const cell: Cell = {
        operation: operation,
        arg1: arg1,
        arg2: arg2,
        value: null
    };

    spreadSheet.addCell(cell);
}
for (let i = 0; i < N; i++) {

    // Write an action using console.log()
    // To debug: console.error('Debug messages...');

    // console.log('1');
    console.log(spreadSheet.getValue(i));
}
