/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const _w: number = parseInt(inputs[0]);
const h: number = parseInt(inputs[1]);
const n: number = parseInt(readline());
const lines: string[] = [];
for (let i = 0; i < h; i++) {
    const line: string = readline();
    lines.push(line);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Robot {
    directions: string[];
    logs: string[];
    y: number;
    x: number;

    constructor(y: number, x: number) {
        this.directions = ['N', 'E', 'S', 'W'];
        this.logs = [];
        this.y = y;
        this.x = x;
    }

    place: () => string = (): string => {
        return `${this.x} ${this.y}`;
    }

    placeWithDirection: () => string = (): string => {
        return `${this.place()} ${this.direction()}`;
    }

    direction: () => string = (): string => {
        return this.directions[0];
    }

    forward: () => void = (): void => {
        const direction: string = this.direction();
        if (direction === 'N') {
            this.y--;
        } else if (direction === 'E') {
            this.x++;
        } else if (direction === 'S') {
            this.y++;
        } else if (direction === 'W') {
            this.x--;
        }
    }

    aheadMassIndex: () => [number, number] = (): [number, number] => {
        const direction: string = this.direction();
        if (direction === 'N') {
            return [this.y - 1, this.x];
        } else if (direction === 'E') {
            return [this.y, this.x + 1];
        } else if (direction === 'S') {
            return [this.y + 1, this.x];
        } else if (direction === 'W') {
            return [this.y, this.x - 1];
        }
    }

    aheadMass: (grid: string[][]) => string = (grid: string[][]): string => {
        const [y, x]: [number, number] = this.aheadMassIndex();
        if (grid.length <= y || grid[0].length <= x) {
            return null;
        }

        return grid[y][x];
    }

    turnRight: () => void = (): void => {
        const direction: string = this.directions.shift();
        this.directions.push(direction);
    }

    log: () => void = (): void => {
        this.logs.push(this.placeWithDirection());
    }

    isLoggedPlace: () => boolean = (): boolean => {
        return this.logs.includes(this.placeWithDirection());
    }

    skipedTurn: (n: number, turn: number) => number = (n: number, turn: number): number => {
        const loopBeginTurn: number = this.logs.indexOf(this.placeWithDirection());
        const loopSize: number = turn - loopBeginTurn;

        return n - ((n - loopBeginTurn) % loopSize);
    }
}

const grid: string[][] = lines.map(line => line.split(''));

const robotY: number = grid.findIndex(row => row.includes('O'));
const robotX: number = grid[robotY].indexOf('O');
const robot: Robot = new Robot(robotY, robotX);

let turn: number = 0;
while (turn < n) {
    turn++;

    robot.log();

    robot.forward();

    while (robot.aheadMass(grid) === '#') {
        robot.turnRight();
    }

    // omit to loop turn
    if (robot.isLoggedPlace()) {
        turn = robot.skipedTurn(n, turn);
    }
}

const result: string = robot.place();

// console.log('answer');
console.log(result);
