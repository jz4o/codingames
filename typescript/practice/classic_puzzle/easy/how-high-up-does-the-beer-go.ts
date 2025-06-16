/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const bottomRadius: number = parseFloat(inputs[0]);
const topRadius: number = parseFloat(inputs[1]);
const glassHeight: number = parseFloat(inputs[2]);
const beerVol: number = parseFloat(inputs[3]);

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const round: (num: number, ndigits?: number) => number = (num: number, ndigits: number = 0): number => {
    const adjust: number = 10 ** ndigits;

    return Math.round(num * adjust) / adjust;
};

const calcVolume: (bottomRadius: number, topRadius: number, height: number) => number = (bottomRadius: number, topRadius: number, height: number): number => {
    return (1 / 3) * Math.PI * height * ((bottomRadius ** 2) + bottomRadius * topRadius + (topRadius ** 2));
};

const inclination: number = (topRadius - bottomRadius) / glassHeight;

let minHeight: number = 0;
let maxHeight: number = glassHeight;
let tempHeight: number = round(glassHeight / 2, 1);

const heightVolumeObject: { [key: number]: number } = {};
while (!(tempHeight in heightVolumeObject)) {
    const tempTopRadius: number = bottomRadius + tempHeight * inclination;
    const volume: number = calcVolume(bottomRadius, tempTopRadius, tempHeight);

    heightVolumeObject[tempHeight] = volume;

    if (volume < beerVol) {
        minHeight = tempHeight;
        tempHeight = round((tempHeight + maxHeight) / 2, 1);
    } else {
        maxHeight = tempHeight;
        tempHeight = round((tempHeight + minHeight) / 2, 1);
    }
}

const [nearestHeightStr, _nearestVolume]: [string, number] = Object
    .entries(heightVolumeObject)
    .sort(([_aK, aV], [_bK, bV]) => Math.abs(aV - beerVol) - Math.abs(bV - beerVol))
    .shift();
const nearestHeight: number = parseFloat(nearestHeightStr);

const result: string = nearestHeight.toFixed(1);

// console.log('height of beer');
console.log(result);

