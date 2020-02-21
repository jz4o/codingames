/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

interface Cage {
    sick: number;
    healthy: number;
    alive: number;
}

const N: number = parseInt(readline());
const Y: number = parseInt(readline());
const cages: Cage[] = [];
for (let i = 0; i < N; i++) {
    var inputs: string[] = readline().split(' ');
    const S: number = parseInt(inputs[0]);
    const H: number = parseInt(inputs[1]);
    const A: number = parseInt(inputs[2]);

    cages.push({sick: S, healthy: H, alive: A});
}
for (let i = 0; i < Y; i++) {

    // Write an action using console.log()
    // To debug: console.error('Debug messages...');

    let alive: number = 0;
    cages.forEach(cage => {
        const sick = cage['sick'] * (2 ** i);
        cage['alive'] -= sick;
        alive += Math.max(cage['alive'], 0);
    });

    // console.log('answer');
    console.log(alive);

    if (alive === 0) {
        break;
    }
}
