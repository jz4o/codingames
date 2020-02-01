/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const LON: string = readline();
const LAT: string = readline();
const N: number = parseInt(readline());

interface Defib {
    id:        string;
    name:      string;
    address:   string;
    phone:     string;
    longitude: number;
    latitude:  number;
}

let defibs: Defib[] = [];
for (let i = 0; i < N; i++) {
    const DEFIB: string = readline();

    const defibElements: string[] = DEFIB.split(';');
    let defib: Defib = {
        id:        defibElements[0],
        name:      defibElements[1],
        address:   defibElements[2],
        phone:     defibElements[3],
        longitude: parseFloat(defibElements[4].replace(',', '.')),
        latitude:  parseFloat(defibElements[5].replace(',', '.'))
    };

    defibs.push(defib);
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const floatLat: number = parseFloat(LAT.replace(',', '.'));
const floatLon: number = parseFloat(LON.replace(',', '.'));

let nearDefib: Defib = defibs[0];
let distance: number = 10000;
for (const defib of defibs) {
    const x: number = (floatLon - defib.longitude) * Math.cos((defib.latitude + floatLat) / 2);
    const y: number = floatLat - defib.latitude;
    const d: number = Math.sqrt(x * x + y * y) * 6371;

    if (d < distance) {
        distance = d;
        nearDefib = defib;
    }
}

// console.log('answer');
console.log(nearDefib.name);
