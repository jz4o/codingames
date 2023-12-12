/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const side: number = parseFloat(inputs[0]);
const diameter: number = parseFloat(inputs[1]);

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const allAreaSize: number = Math.pow(side, 2);
const circleAreaSize: number = Math.pow(diameter / 2, 2) * Math.PI;

const wastefulCircleCount: number = Math.pow(Math.floor(side / diameter), 2);

let remainAreaSize: number = allAreaSize - (circleAreaSize * wastefulCircleCount);
let frugalCircleCount: number = wastefulCircleCount;

let remainSide: number;
while (diameter <= (remainSide = Math.sqrt(remainAreaSize))) {
    const addCircleCount: number = Math.floor(Math.pow(remainSide / diameter, 2));

    remainAreaSize -= circleAreaSize * addCircleCount;
    frugalCircleCount += addCircleCount;
}

const result: number = frugalCircleCount - wastefulCircleCount;

// console.log('how many more biscuit');
console.log(result);
