/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

var inputs: string[] = readline().split(' ');
const W: number = parseInt(inputs[0]);
const H: number = parseInt(inputs[1]);
var inputs: string[] = readline().split(' ');
const X: number = parseInt(inputs[0]);
const Y: number = parseInt(inputs[1]);
const grid: string[][] = [];
grid.push(Array(W + 2).fill(null));
for (let i = 0; i < H; i++) {
    const R: string = readline();

    grid.push([null, ...R.split(''), null]);
}
grid.push(Array(W + 2).fill(null));

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

interface Mass {
    y: number;
    x: number;
}

const checkedMasses: Mass[] = [];
const beCheckMasses: Mass[] = [{y: Y + 1, x: X + 1}];
const exitMasses: Mass[] = [];
while (beCheckMasses.length > 0) {
    const checkMass: Mass = beCheckMasses.pop();
    const y: number = checkMass.y;
    const x: number = checkMass.x;

    if (checkedMasses.find(mass => mass.y === y && mass.x === x)) {
        continue;
    }

    checkedMasses.push({y: y, x: x});

    const nearMasses: Mass[] = [];
    nearMasses.push({y: y, x: x - 1});
    nearMasses.push({y: y - 1, x: x});
    nearMasses.push({y: y, x: x + 1});
    nearMasses.push({y: y + 1, x: x});

    nearMasses.forEach(nearMass => {
        const mass: string = grid[nearMass.y][nearMass.x];
        if (mass === '.') {
            beCheckMasses.push({y: nearMass.y, x: nearMass.x});
        } else if (mass === null) {
            exitMasses.push({x: x - 1, y: y - 1});
        }
    });
}

const sortedExitMasses = exitMasses.sort((a, b) => {
    if (a.x !== b.x) {
        return a.x - b.x;
    }

    return a.y - b.y;
});

// console.log('answer');
console.log(exitMasses.length);
sortedExitMasses.forEach(exitMass => {
    console.log(`${exitMass.x} ${exitMass.y}`);
});
