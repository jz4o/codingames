/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const rows: string[] = [];
for (let i = 0; i < 10; i++) {
    const row: string = readline();
    rows.push(row);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Position {
    y: number;
    x: number;

    constructor(y: number, x: number) {
        this.y = y;
        this.x = x;
    }

    getAroundPositions: () => Position[] = (): Position[] => {
        return [
            new Position(this.y - 1, this.x),
            new Position(this.y, this.x - 1),
            new Position(this.y, this.x + 1),
            new Position(this.y + 1, this.x)
        ];
    };
}

const EMPTY: string = '.';
const WALL: string = '#';
const MOTHER: string = 'M';
const CHILD: string = 'C';

const grid: string[][] = rows.map(row => row.split(''));
grid.forEach(row => {
    row.unshift(WALL);
    row.push(WALL);
});
grid.unshift(Array(grid[0].length).fill(WALL));
grid.push(Array(grid[0].length).fill(WALL));

const motherRowIndex: number = grid.findIndex(row => row.includes(MOTHER));
const motherColumnIndex: number = grid[motherRowIndex].indexOf(MOTHER);
const motherPosition: Position = new Position(motherRowIndex, motherColumnIndex);
grid[motherRowIndex][motherColumnIndex] = '0';

const checkPositions: Position[] = motherPosition.getAroundPositions();

let foundFlag: boolean = false;
let turn: number = 0;
while (!foundFlag) {
    turn++;

    const nextCheckPositions: Position[] = [];
    checkPositions.some(checkPosition => {
        const positionValue: string = grid[checkPosition.y][checkPosition.x];

        if (positionValue === CHILD) {
            foundFlag = true;
            return true;
        }

        if (positionValue !== EMPTY) {
            return false;
        }

        grid[checkPosition.y][checkPosition.x] = turn.toString();
        nextCheckPositions.push(...checkPosition.getAroundPositions());

        return false;
    });

    checkPositions.splice(0, Infinity, ...nextCheckPositions);
}

const result: string = `${turn * 10}km`;

// console.log('shortest distance in km');
console.log(result);
