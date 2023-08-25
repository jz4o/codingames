/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const lines: string[] = [];
for (let i = 0; i < 3; i++) {
    const line: string = readline(); // One line out of three in the string describing the starting position.
    lines.push(line);
}
const commands: string = readline(); // The sequence of ULDR-characters describing the steps to perform.

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Dice {
    front: number;
    left: number;
    on: number;
    right: number;
    opposite: number;
    behind: number;

    constructor(diceNumbers: number[]) {
        [this.front, this.left, this.on, this.right, this.opposite, this.behind] = diceNumbers;
    }

    walk: Function = (commands: string) => {
        const walkToFunctions: { [key: string]: Function } = {
            'U': this.walkToForward,
            'D': this.walkToBackward,
            'L': this.walkToLeft,
            'R': this.walkToRight,
        };
        const dummyFunction: Function = () => {};

        commands.split('').forEach(command => {
            const walkToFunction: Function = walkToFunctions[command] || dummyFunction;
            walkToFunction();
        });
    };

    walkToForward: Function = () => {
        [this.front, this.on, this.opposite, this.behind]
            = [this.opposite, this.front, this.behind, this.on];
    };

    walkToBackward: Function = () => {
        [this.front, this.left, this.on, this.right, this.opposite, this.behind]
            = [this.opposite, this.right, this.behind, this.left, this.front, this.on];
    };

    walkToLeft: Function = () => {
        [this.front, this.left, this.on, this.right, this.opposite, this.behind]
            = [this.opposite, this.behind, this.left, this.front, this.right, this.on];
    };

    walkToRight: Function = () => {
        [this.front, this.left, this.on, this.right, this.opposite, this.behind]
            = [this.opposite, this.front, this.right, this.behind, this.left, this.on];
    };
}

const diceNumbers: number[] = lines.join('').replace(/ /g, '').split('').map(diceNumber => parseInt(diceNumber));
const dice: Dice = new Dice(diceNumbers);

dice.walk(commands);

const result: string = dice.on.toString();

// The number on the side you end up on after having performed `commands`.
// console.log('number');
console.log(result);
