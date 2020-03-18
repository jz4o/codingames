/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

var inputs: string[] = readline().split(' ');
const W: number = parseInt(inputs[0]); // number of columns.
const H: number = parseInt(inputs[1]); // number of rows.
const grid: number[][] = [];
for (let i = 0; i < H; i++) {
    const LINE: string = readline(); // represents a line in the grid and contains W integers. Each integer represents one room of a given type.

    grid.push(LINE.split(' ').map(i => parseInt(i)));
}
const EX: number = parseInt(readline()); // the coordinate along the X axis of the exit (not useful for this first mission, but must be read).

// direction
const TOP:    number = 0;
const LEFT:   number = 1;
const RIGHT:  number = 2;
const BOTTOM: number = 3;
const NONE:   number = null;

// Key   : direction of entrance
// Value : direction of exit(index: type of panel)
const PANEL_DESTINATION: {[key: string]: number[]} = {
    'TOP':   [NONE, BOTTOM, NONE,  BOTTOM, LEFT,   RIGHT,  NONE,  BOTTOM, NONE,   BOTTOM, LEFT, RIGHT, NONE,   NONE],
    'LEFT':  [NONE, BOTTOM, RIGHT, NONE,   NONE,   BOTTOM, RIGHT, NONE,   BOTTOM, BOTTOM, NONE, NONE,  NONE,   BOTTOM],
    'RIGHT': [NONE, BOTTOM, LEFT,  NONE,   BOTTOM, NONE,   LEFT,  BOTTOM, BOTTOM, NONE,   NONE, NONE,  BOTTOM, NONE]
};

// game loop
while (true) {
    var inputs: string[] = readline().split(' ');
    const XI: number = parseInt(inputs[0]);
    const YI: number = parseInt(inputs[1]);
    const POS: string = inputs[2];

    // Write an action using console.log()
    // To debug: console.error('Debug messages...');

    const panelType: number = grid[YI][XI];
    const nextDest: number = PANEL_DESTINATION[POS][panelType];

    let nextXi = XI;
    let nextYi = YI;
    if (nextDest === LEFT) {
        nextXi--;
    } else if (nextDest === RIGHT) {
        nextXi++;
    } else if (nextDest === BOTTOM) {
        nextYi++;
    }

    // One line containing the X Y coordinates of the room in which you believe Indy will be on the next turn.
    // console.log('0 0');
    console.log(`${nextXi} ${nextYi}`);
}
