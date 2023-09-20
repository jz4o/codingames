/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const MARKS: {[key: string]: string} = {
    black: '#',
    white: '.'
};
const directions: string[] = ['N', 'E', 'S', 'W'];

const inputs1: string[] = readline().split(' ');
const _W: number = parseInt(inputs1[0]);
const H: number = parseInt(inputs1[1]);
const inputs2: string[] = readline().split(' ');
const x: number = parseInt(inputs2[0]);
const y: number = parseInt(inputs2[1]);
let xTmp: number = x;
let yTmp: number = y;
const direction: string = readline();
while (directions[0] !== direction) {
    directions.push(directions.shift());
}
const T: number = parseInt(readline());
const grid: string[][] = [];
for (let i = 0; i < H; i++) {
    const C: string = readline();
    grid.push(C.split(''))
}
for (let i = 0; i < T; i++) {

    // Write an action using console.log()
    // To debug: console.error('Debug messages...');

    const colorIsBlack: boolean = grid[yTmp][xTmp] === MARKS['black'];
    if (colorIsBlack) {
        directions.push(directions.shift());
    } else {
        directions.unshift(directions.pop());
    }

    grid[yTmp][xTmp] = colorIsBlack ? MARKS['white'] : MARKS['black'];

    if (directions[0] === 'N') {
        yTmp--;
    } else if (directions[0] === 'E') {
        xTmp++;
    } else if (directions[0] === 'W') {
        xTmp--;
    } else if (directions[0] === 'S') {
        yTmp++;
    }

    // console.log('answer');
}

grid.forEach(row => {
    console.log(row.join(''));
});

