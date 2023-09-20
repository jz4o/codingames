/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 * ---
 * Hint: You can use the debug stream to print initialTX and initialTY, if Thor seems not follow your orders.
 **/

const inputs: string[] = readline().split(' ');
const lightX: number = parseInt(inputs[0]); // the X position of the light of power
const lightY: number = parseInt(inputs[1]); // the Y position of the light of power
const initialTx: number = parseInt(inputs[2]); // Thor's starting X position
const initialTy: number = parseInt(inputs[3]); // Thor's starting Y position

let tx: number = initialTx;
let ty: number = initialTy;

// game loop
let _remainingTurns: number; // The remaining amount of turns Thor can move. Do not remove this line.
while ((_remainingTurns = parseInt(readline() || '-1')) !== -1) {
    // Write an action using console.log()
    // To debug: console.error('Debug messages...');

    // Direction Initialize
    let moveX: string = '';
    let moveY: string = ''

    // duguage X
    if (lightX < tx) {
        moveX = 'W';
        tx--;
    } else if (tx < lightX) {
        moveX = 'E';
        tx++;
    }

    // duguage Y
    if (lightY < ty) {
        moveY = 'N';
        ty--;
    } else if (ty < lightY) {
        moveY = 'S';
        ty++;
    }

    // A single line providing the move to be made: N NE E SE S SW W or NW
    // console.log('SE');
    console.log(`${moveY}${moveX}`);
}

