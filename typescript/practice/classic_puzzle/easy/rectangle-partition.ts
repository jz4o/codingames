/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

var inputs: string[] = readline().split(' ');
const w: number = parseInt(inputs[0]);
const h: number = parseInt(inputs[1]);
const countX: number = parseInt(inputs[2]);
const countY: number = parseInt(inputs[3]);
var inputs: string[] = readline().split(' ');
const widthMeasurements: number[] = [0];
for (let i = 0; i < countX; i++) {
    const x: number = parseInt(inputs[i]);

    widthMeasurements.push(x);
}
widthMeasurements.push(w);
var inputs: string[] = readline().split(' ');
const heightMeasurements: number[] = [0];
for (let i = 0; i < countY; i++) {
    const y: number = parseInt(inputs[i]);

    heightMeasurements.push(y);
}
heightMeasurements.push(h);

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const widthCounts: { [key: number]: number; } = {};
widthMeasurements.forEach((widthMeasurement, index) => {
    widthMeasurements.slice(0, index)
        .forEach(width => {
            widthCounts[widthMeasurement - width] = (widthCounts[widthMeasurement - width] || 0) + 1;
        });
});

const heightCounts: { [key: number]: number } = {};
heightMeasurements.forEach((heightMeasurement, index) => {
    heightMeasurements.slice(0, index)
        .forEach(height => {
            heightCounts[heightMeasurement - height] = (heightCounts[heightMeasurement - height] || 0) + 1;
        });
});

const result: number = Object.keys(widthCounts)
        .reduce((sum, k) => sum + widthCounts[k] * (heightCounts[k] || 0), 0);

// console.log('0');
console.log(result);
