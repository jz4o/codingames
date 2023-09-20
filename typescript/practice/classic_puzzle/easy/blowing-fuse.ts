/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs1: string[] = readline().split(' ');
const n: number = parseInt(inputs1[0]);
const m: number = parseInt(inputs1[1]);
const c: number = parseInt(inputs1[2]);
const inputs2: string[] = readline().split(' ');
const nxs: number[] = [];
for (let i = 0; i < n; i++) {
    const nx: number = parseInt(inputs2[i]);
    nxs.push(nx);
}
const inputs3: string[] = readline().split(' ');
const mxs: number[] = [];
for (let i = 0; i < m; i++) {
    const mx: number = parseInt(inputs3[i]);
    mxs.push(mx);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Device {
    ampere: number;
    status: 'on' | 'off';

    constructor(ampere: number) {
       this.ampere = ampere;
       this.status = 'off';
    }

    switch(): number {
        if (this.status === 'on') {
            this.status = 'off';
            return -this.ampere;
        } else {
            this.status = 'on';
            return this.ampere;
        }
    }
}

const devices: Device[] = [new Device(0), ...nxs.map(nx => new Device(nx))];

let sumAmpere: number = 0;
const sumAmperes: number[] = mxs.map(mx => sumAmpere += devices[mx].switch());
const maxSumAmpere: number = sumAmperes.reduce((max, ampere) => Math.max(max, ampere));

const results: string[] = [];
if (c < maxSumAmpere) {
    results.push('Fuse was blown.');
} else {
    results.push('Fuse was not blown.');
    results.push(`Maximal consumed current was ${maxSumAmpere} A.`);
}

// console.log('Fuse was not blown.');
// console.log('Maximal consumed current was XX A.');
results.forEach(result => {
    console.log(result);
});
