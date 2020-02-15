/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

var inputs: string[] = readline().split(' ');
const w: number = parseInt(inputs[0]);
const h: number = parseInt(inputs[1]);
const n: number = parseInt(readline());
const map: string[][] = []
for (let i = 0; i < h; i++) {
    const line: string = readline();

    map.push(line.split(''));
}

const directions: string[] = ['N', 'E', 'S', 'W'];
let directionIndex: number = 0;

let yIndex: number;
let xIndex: number;
map.forEach((line, index) => {
    if (line.includes('O')) {
        yIndex = index;
        xIndex = line.indexOf('O');
        return;
    }
});

const initialY: number = yIndex;
const initialX: number = xIndex;

let turn: number = 0;
while (turn < n) {
    turn++;

    let direction: string = directions[directionIndex];

    // forward
    switch (direction) {
        case 'N':
            yIndex--;
            break;
        case 'E':
            xIndex++;
            break;
        case 'W':
            xIndex--;
            break;
        case 'S':
            yIndex++;
            break;
    }

    // get ahead mass
    let aheadMass: string;
    if (direction === 'N' && yIndex > 0) {
        aheadMass = map[yIndex - 1][xIndex];
    } else if (direction === 'E' && xIndex < w - 1) {
        aheadMass = map[yIndex][xIndex + 1];
    } else if (direction === 'W' && xIndex > 0) {
        aheadMass = map[yIndex][xIndex - 1];
    } else if (direction === 'S' && yIndex < h - 1) {
        aheadMass = map[yIndex + 1][xIndex];
    }

    // turn right if obstacle in ahead mass
    if (aheadMass === '#' || aheadMass === undefined) {
        directionIndex = (directionIndex + 1) % directions.length;
        direction = directions[directionIndex];
    }

    // omit to loop turn
    if (xIndex === initialX && yIndex === initialY && direction === 'N') {
        turn = n - (n % turn);
    }
}

// echo "$x $y"
console.log(`${xIndex} ${yIndex}`);
