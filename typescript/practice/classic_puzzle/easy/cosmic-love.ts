/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const inputRows: [string, string, string, string][] = [];
for (let i = 0; i < N; i++) {
    const [name, r, m, c]: string[] = readline().split(' ');

    inputRows.push([name, r, m, c]);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Planet = {
    name: string,
    r: number,
    m: number,
    c: number
};

const planets: Planet[] = inputRows.map(inputRow => {
    const [name, strR, strM, strC]: [string, string, string, string] = inputRow;
    const r: number = parseFloat(strR);
    const m: number = parseFloat(strM);
    const c: number = parseFloat(strC);

    return { name, r, m, c };
});

const aliceIndex: number = planets.findIndex(planet => planet.name === 'Alice');
const [alice]: Planet[] = planets.splice(aliceIndex, 1);

const ra: number = alice.r;
const va: number = 4 / 3 * Math.PI * (ra ** 3);
const da: number = alice.m / va;

const closestPlanet: Planet = planets.sort((a, b) => a.c - b.c).find(planet => {
    const rp: number = planet.r;
    const vp: number = 4 / 3 * Math.PI * (rp ** 3);
    const dp: number = planet.m / vp;

    const rocheLimit: number = ra * Math.cbrt(2 * da / dp);

    return rocheLimit < planet.c;
});

const result: string = closestPlanet.name;

// console.log('answer');
console.log(result);

