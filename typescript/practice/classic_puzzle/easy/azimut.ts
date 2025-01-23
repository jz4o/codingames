/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const startDirection: string = readline();
const N: number = parseInt(readline());
const turns: string[] = [];
for (let i = 0; i < N; i++) {
    const turn: string = readline();
    turns.push(turn);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const DIRECTIONS: string[] = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'];
const directionIndex: number = DIRECTIONS.indexOf(startDirection);

const moveFunctions: {[key: string]: (direction: number) => number} = {
    'RIGHT': (direction) => direction + 1,
    'LEFT': (direction) => direction - 1,
    'BACK': (direction) => direction + 4,
};
const stayFunction: (direction: number) => number = (direction: number): number => direction;

const resultDirection: number = turns.reduce((direction, turn) => {
    const nextDirection = (moveFunctions[turn] || stayFunction)(direction);

    return (nextDirection + DIRECTIONS.length) % DIRECTIONS.length;
}, directionIndex);

const result: string = DIRECTIONS[resultDirection];

// console.log('direction');
console.log(result);
