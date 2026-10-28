/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const S: number = parseInt(readline(), 10);
const h: number = parseInt(readline(), 10);
const flow: number = parseInt(readline(), 10);
const n: number = parseInt(readline(), 10);
const leakRows: [number, number][] = [];
for (let i = 0; i < n; i++) {
    const inputs: string[] = readline().split(' ');
    const leakHeight: number = parseInt(inputs[0], 10);
    const leakFlow: number = parseInt(inputs[1], 10);
    leakRows.push([leakHeight, leakFlow]);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

interface Leak {
    height: number;
    flow: number;
}

const leaks: Leak[] = leakRows
    .map(([leakHeight, leakFlow]) => ({ height: leakHeight, flow: leakFlow }))
    .sort((a, b) => a.height - b.height);

const heights: number[] = [...new Set(leaks.map(leak => leak.height))];
heights.forEach((height, index) => {
    const targetLeaks: Leak[] = leaks.filter(leak => leak.height === height);
    const count: number = targetLeaks.length;
    if (count <= 1) {
        return;
    }

    const totalFlow: number = targetLeaks.reduce((sum, leak) => sum + leak.flow, 0);
    leaks.splice(index, count, { height, flow: totalFlow });
});

leaks.push({height: h, flow: 0});

let currentHeight: number = 0;
let currentFlow: number = flow;
let elapsedTime: number = 0;
leaks.some(leak => {
    const diffHeight: number = leak.height - currentHeight;
    if (diffHeight > 0) {
        elapsedTime += S / currentFlow / 1000 * diffHeight;
    }

    currentHeight = leak.height;

    currentFlow -= leak.flow;
    return currentFlow <= 0;
});

let result: string;
if (currentHeight === h) {
    const elapsedSeconds: number = Math.floor(elapsedTime * 60);

    const hour: number = Math.floor(elapsedSeconds / 3600);
    const remainSeconds: number = elapsedSeconds % 3600;

    const minute: number = Math.floor(remainSeconds / 60);
    const seconds: number = remainSeconds % 60;

    result = [hour, minute, seconds].map(t => t.toString().padStart(2, '0')).join(':');
} else {
    result = `Impossible, ${currentHeight} cm.`;
}

// console.log('00:00:00');
console.log(result);
