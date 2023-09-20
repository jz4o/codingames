/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const ROUNDS: number = parseInt(readline());
const CASH: number = parseInt(readline());
let result: number = CASH
for (let i = 0; i < ROUNDS; i++) {
    const bet = Math.ceil(result / 4);
    result -= bet;

    const PLAY: string = readline();
    const playElements: string[] = PLAY.split(' ');
    const ball: number = parseInt(playElements[0]);
    const call: string = playElements[1];
    const target: number = parseInt(playElements[2]);

    switch (call) {
        case 'PLAIN':
            if (ball === target) {
                result += bet * 36;
            }
            break;
        case 'ODD':
            if (ball % 2 === 1) {
                result += bet * 2;
            }
            break;
        case 'EVEN':
            if (ball % 2 === 0 && ball > 0) {
                result += bet * 2;
            }
            break;
    }
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

// console.log('cash of the target after playing');
console.log(result);

