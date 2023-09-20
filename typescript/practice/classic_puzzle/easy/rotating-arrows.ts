/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs1: string[] = readline().split(' ');
const W: number = parseInt(inputs1[0]);
const H: number = parseInt(inputs1[1]);
const inputs2: string[] = readline().split(' ');
const x: number = parseInt(inputs2[0]);
const y: number = parseInt(inputs2[1]);
const lines: string[] = [];
for (let i = 0; i < H; i++) {
    const line: string = readline(); // The line of w arrows represented by ascii char ^v<>
    lines.push(line);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Position {
    y: number;
    x: number;
    value: string;

    constructor(y: number, x: number, value: string) {
        this.y = y;
        this.x = x;
        this.value = value;
    }

    arrowPosition: () => [number, number] = (): [number, number] => {
        if (this.value === '^') {
            return [this.y - 1, this.x];
        } else if (this.value === '>') {
            return [this.y, this.x + 1];
        } else if (this.value === 'v') {
            return [this.y + 1, this.x];
        } else if (this.value === '<') {
            return [this.y, this.x - 1];
        } else {
            return [0, 0];
        }
    };

    rotateArrow: () => void = () => {
        const arrows: string[] = ['^', '>', 'v', '<'];
        const arrowIndex: number = arrows.indexOf(this.value);
        const nextArrow: string = arrows[(arrowIndex + 1) % arrows.length];

        this.value = nextArrow;
    };

    isEqualPosition: (y: number, x: number) => boolean = (y: number, x: number): boolean => {
        return this.y === y && this.x === x;
    };

    isOverFlow: () => boolean = (): boolean => {
        return this.value === 'X';
    };
}

const charGrid: string[][] = lines.map(line => `X${line}X`.split(''));
charGrid.unshift(Array(W + 2).fill('X'));
charGrid.push(Array(W + 2).fill('X'));

const grid: Position[][] = charGrid.map((charRow, rowIndex) => {
    return charRow.map((value, valueIndex) => new Position(rowIndex, valueIndex, value));
});

let times: number = 0;
let currentPosition: Position = grid[y + 1][x + 1];
do {
    times++;

    currentPosition.rotateArrow();
    const [arrowY, arrowX]: number[] = currentPosition.arrowPosition();

    currentPosition = grid[arrowY][arrowX];
} while (!currentPosition.isEqualPosition(y + 1, x + 1) && !currentPosition.isOverFlow());

const result: string = times.toString();

// console.log('0');
console.log(result);
