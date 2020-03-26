/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

var inputs: string[] = readline().split(' ');
const W: number = parseInt(inputs[0]); // width of the building.
const H: number = parseInt(inputs[1]); // height of the building.
const N: number = parseInt(readline()); // maximum number of turns before game over.
var inputs: string[] = readline().split(' ');
const X0: number = parseInt(inputs[0]);
const Y0: number = parseInt(inputs[1]);

let bombMinHeight: number = H;
let bombMaxHeight: number = 0;
let bombMinWidth: number = 0;
let bombMaxWidth: number = W;

let x: number = X0;
let y: number = Y0;

// game loop
while (true) {
    const bombDir: string = readline(); // the direction of the bombs from batman's current location (U, UR, R, DR, D, DL, L or UL)

    // Write an action using console.log()
    // To debug: console.error('Debug messages...');

    if (bombDir.includes('U')) {
        bombMinHeight = y;
        y -= Math.ceil((y - bombMaxHeight) / 2);
    } else if (bombDir.includes('D')) {
        bombMaxHeight = y;
        y += Math.ceil((bombMinHeight - y) / 2);
    }

    if (bombDir.includes('R')) {
        bombMinWidth = x;
        x += Math.ceil((bombMaxWidth - x) / 2);
    } else if (bombDir.includes('L')) {
        bombMaxWidth = x;
        x -= Math.ceil((x - bombMinWidth) / 2);
    }

    // the location of the next window Batman should jump to.
    // console.log('0 0');
    console.log(`${x} ${y}`);
}
