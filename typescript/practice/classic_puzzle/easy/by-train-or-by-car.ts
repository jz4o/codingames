/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const T: string = readline();
const N: number = parseInt(readline(), 10);
const fnames: string[] = [];
for (let i = 0; i < N; i++) {
    const FNAME: string = readline();
    fnames.push(FNAME);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const calcTrainMinutes: (betweens: number[]) => number = (betweens: number[]): number => {
    const toStation: number = 35;
    const toDestination: number = 30;

    const move: number = betweens.reduce((move, between) => {
        return move + (Math.min(6, between) * 60 / 50) + (Math.max(between - 6, 0) * 60 / 284);
    }, 0);
    const pause: number = (betweens.length - 1) * 8;

    return Math.floor(toStation + move + pause + toDestination);
};

const calcCarMinutes: (betweens: number[]) => number = (betweens: number[]): number => {
    const move: number = betweens.reduce((move, between) => {
        return move + (Math.min(14, between) * 60 / 50) + (Math.max(between - 14, 0) * 60 / 105);
    }, 0);

    return Math.floor(move);
};

const routes: { [key: string]: { to: string, distance: number } } = {};
fnames.forEach(fname => {
    const [city1, city2, distanceStr]: string[] = fname.split(' ');
    const distance: number = parseFloat(distanceStr);

    routes[city1] = { to: city2, distance };
});

const [startingCity, destination]: string[] = T.split(' ');

const betweenDistances: number[] = [];
let fromCity: string = startingCity;
while (fromCity !== destination) {
    betweenDistances.push(routes[fromCity].distance);

    fromCity = routes[fromCity].to;
}

const trainMinutes: number = calcTrainMinutes(betweenDistances);
const carMinutes: number = calcCarMinutes(betweenDistances);

const fasterVehicle: string = trainMinutes < carMinutes ? 'TRAIN' : 'CAR';
const fasterMinutes: number = Math.min(trainMinutes, carMinutes);

const h: number = Math.floor(fasterMinutes / 60);
const m: number = fasterMinutes % 60;
const formattedM: string = m.toString().padStart(2, '0');

const result: string = `${fasterVehicle} ${h}:${formattedM}`;

// console.log('answer');
console.log(result);
