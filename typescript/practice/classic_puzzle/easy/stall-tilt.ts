/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const v: number = parseInt(readline());
const speeds: number[] = [];
for (let i = 0; i < n; i++) {
    const speed: number = parseInt(readline());
    speeds.push(speed);
}
const bends: number[] = [];
for (let i = 0; i < v; i++) {
    const bend: number = parseInt(readline());
    bends.push(bend);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Motorcycle = {
    name: string,
    speed: number
};

const ALPHABETS: string = 'abcdefghijklmnopqrstuvwxyz';
const BORDER_TAN: number = Math.tan(60 * Math.PI / 180);
const G: number = 9.81;

let motorcycles: Motorcycle[] = speeds.map((speed, index) => { return { name: ALPHABETS[index], speed } });
const staledMotorcycles: Motorcycle[] = [];

const borderSpeeds: number[] = bends.map(bend => Math.sqrt(BORDER_TAN * bend * G));
borderSpeeds.forEach(borderSpeed => {
    const bendStaledMotorcycles: Motorcycle[] = motorcycles.filter(motorcycle => borderSpeed < motorcycle.speed).sort((a, b) => b.speed - a.speed);

    motorcycles = motorcycles.filter(motorcycle => !bendStaledMotorcycles.includes(motorcycle));

    staledMotorcycles.unshift(...bendStaledMotorcycles);
});

motorcycles = motorcycles.sort((a, b) => b.speed - a.speed);

const results: string[] = [];
results.push(Math.floor(borderSpeeds.reduce((min, borderSpeed) => Math.min(min, borderSpeed))).toString());
results.push('y');
results.push(...motorcycles.map(motorcycle => motorcycle.name));
results.push(...staledMotorcycles.map(motorcycle => motorcycle.name));

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
