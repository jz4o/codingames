/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const inputRows: [string, string, number][] = [];
for (let i = 0; i < N; i++) {
    const inputs: string[] = readline().split(' ');
    const plate: string = inputs[0];
    const radarname: string = inputs[1];
    const timestamp: number = parseInt(inputs[2]);

    inputRows.push([plate, radarname, timestamp]);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type ScanResult = {
    plate: string,
    radarpoint: number,
    timestamp: number
};

const scanResults: ScanResult[] = inputRows.map(inputRow => {
    const [plate, radarname, timestamp]: [string, string, number] = inputRow;
    const radarpoint: number = parseInt(radarname.split('-').pop());

    return { plate, radarpoint, timestamp };
});
scanResults.sort((a, b) => {
    if (a.plate !== b.plate) {
        return a.plate < b.plate ? -1 : 1;
    }

    return a.radarpoint < b.radarpoint ? -1 : 1;
});

const scanResultsEachCar: { [key: string]: ScanResult[] } = {};
scanResults.forEach(scanResult => {
    if (!(scanResult.plate in scanResultsEachCar)) {
        scanResultsEachCar[scanResult.plate] = [];
    }

    scanResultsEachCar[scanResult.plate].push(scanResult);
});

const plates: string[] = Object.keys(scanResultsEachCar);
plates.sort();

const results: string[] = [];
plates.forEach(plate => {
    const scanResultsForCar: ScanResult[] = scanResultsEachCar[plate];

    const speeds: number[] = [];
    [...Array(scanResultsForCar.length - 1).keys()].forEach(i => {
        const l: ScanResult = scanResultsForCar[i];
        const r: ScanResult = scanResultsForCar[i + 1];

        const distance: number = r.radarpoint - l.radarpoint;
        const time: number = r.timestamp - l.timestamp;

        const speed: number = Math.floor(distance / time * 1000 * 60 * 60);
        speeds.push(speed);
    });

    const maxSpeed: number = speeds.reduce((max, speed) => Math.max(max, speed));

    if (maxSpeed > 130) {
        results.push(`${plate} ${maxSpeed}`);
    }
});

// console.log('ticket');
results.forEach(result => {
    console.log(result);
});
