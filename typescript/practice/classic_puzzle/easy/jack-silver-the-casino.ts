/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const ROUNDS: number = parseInt(readline(), 10);
const CASH: number = parseInt(readline(), 10);
let result: number = CASH;
for (let i = 0; i < ROUNDS; i++) {
    const bet = Math.ceil(result / 4);
    result -= bet;

    const PLAY: string = readline();
    const [ballStr, call, targetStr]: string[] = PLAY.split(' ');
    const ball: number = parseInt(ballStr, 10);
    const target: number = parseInt(targetStr, 10);

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
        default:
            throw new Error();
    }
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

// console.log('cash of the target after playing');
console.log(result);

