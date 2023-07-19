/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const roadLength: number = parseInt(readline()); // The total kilometers of the route.
const zoneQuantity: number = parseInt(readline()); // The number of road construction sites.
const zoneRows: number[][] = [];
for (let i = 0; i < zoneQuantity; i++) {
    var inputs: string[] = readline().split(' ');
    const zoneKm: number = parseInt(inputs[0]); // The kilometer in which the road construction site begins.
    const zoneSpeed: number = parseInt(inputs[1]); // The speed limit of the road construction site.

    zoneRows.push([zoneKm, zoneSpeed]);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const LIMIT_SPEED: number = 130;
const HOUR_MINUTES: number = 60;

const idealMinutes: number = roadLength / LIMIT_SPEED * HOUR_MINUTES;

zoneRows.unshift([0, LIMIT_SPEED]);
zoneRows.push([roadLength, 0]);
const actualMinutes: number = [...Array(zoneRows.length - 1).keys()].reduce((sum, index) => {
    const [zoneKm, zoneSpeed]: number[] = zoneRows[index];
    const [nextZoneKm, _nextZoneSpeed]: number[] = zoneRows[index + 1];

    return sum + (nextZoneKm - zoneKm) / zoneSpeed * HOUR_MINUTES;
}, 0);

const result: number = Math.round(actualMinutes - idealMinutes);

// Difference between theoretical time and travel time
// console.log('0.00');
console.log(result);
