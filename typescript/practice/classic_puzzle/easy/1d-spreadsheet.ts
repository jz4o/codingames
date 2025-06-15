/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

class SpreadSheet {
    cells: Cell[];

    constructor() {
        this.cells = [];
    }

    addCell(cell: Cell): void {
        this.cells.push(cell);
    }

    getValue(cellIndex: number): number {
        return this.cells[cellIndex].value || this.calcValue(cellIndex);
    }

    getArgValue(arg: string): number {
        return arg.includes('$') ? this.getValue(parseInt(arg.slice(1))) : parseInt(arg);
    }

    calcValue(cellIndex: number): number {
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
            default:
                throw new Error();
        }

        return cell.value;
    }
}

interface Cell {
    operation: string;
    arg1: string;
    arg2: string;
    value: number;
}

const spreadSheet: SpreadSheet = new SpreadSheet();

const N: number = parseInt(readline());
for (let i = 0; i < N; i++) {
    const [operation, arg1, arg2]: string[] = readline().split(' ');

    const cell: Cell = { operation, arg1, arg2, value: null };

    spreadSheet.addCell(cell);
}
for (let i = 0; i < N; i++) {

    // Write an action using console.log()
    // To debug: console.error('Debug messages...');

    // console.log('1');
    console.log(spreadSheet.getValue(i));
}

