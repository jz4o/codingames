/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const inputs: string[] = readline().split(' ');
let piles: number[] = [];
for (let i = 0; i < N; i++) {
    const C: number = parseInt(inputs[i]);

    piles.push(C);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

piles = piles.filter(pile => pile !== 0);

let sameConfigurationIndex: number;
const configurations: string[] = [];

while (sameConfigurationIndex === undefined) {
    configurations.push(piles.sort().join(' '));

    const pilesSize: number = piles.length;
    piles = piles.map(pile => pile - 1).filter(pile => pile !== 0).concat(pilesSize);

    const configuration: string = piles.sort().join(' ');

    if (configurations.includes(configuration)) {
        sameConfigurationIndex = configurations.indexOf(configuration);
    }
}

// console.log('1');
console.log(configurations.length - sameConfigurationIndex);
