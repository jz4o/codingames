/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const aSpeed: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Converter = {
    name: string,
    rate: number
};

const DISTANCE_CONVERTERS: Converter[] = [
    { name: 'miles', rate: 1 },
    { name: 'furlongs', rate: 8 },
    { name: 'chains', rate: 10 },
    { name: 'yards', rate: 22 },
    { name: 'feet', rate: 3 },
    { name: 'inches', rate: 12 }
];

const UNIT_CONVERTERS: Converter[] = [
    { name: 'fortnights', rate: 1 },
    { name: 'weeks', rate: 2 },
    { name: 'days', rate: 7 },
    { name: 'hours', rate: 24 },
    { name: 'minutes', rate: 60 },
    { name: 'seconds', rate: 60 }
];

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const [_, speed, dist1, time1, dist2, time2]: string[] = aSpeed.match(/(\d+)\s(.*)\sper\s(.*)\sCONVERT\sTO\s(.*)\sper\s(.*)/);

const dist1RegExp: RegExp = new RegExp(`${dist1}s?`);
const dist2RegExp: RegExp = new RegExp(`${dist2}s?`);
const fromDistIndex: number = DISTANCE_CONVERTERS.findIndex(converter => dist1RegExp.test(converter.name));
const toDistIndex: number = DISTANCE_CONVERTERS.findIndex(converter => dist2RegExp.test(converter.name));
let distanceRate: number;
if (fromDistIndex < toDistIndex) {
    distanceRate = rangeArrayFromTo(fromDistIndex + 1, toDistIndex).reduce((mul, index) => mul * DISTANCE_CONVERTERS[index].rate, 1);
} else if (fromDistIndex === toDistIndex) {
    distanceRate = 1;
} else {
    distanceRate = 1 / rangeArrayFromTo(toDistIndex + 1, fromDistIndex).reduce((mul, index) => mul * DISTANCE_CONVERTERS[index].rate, 1);
}

const time1RegExp: RegExp = new RegExp(`${time1}s?`);
const time2RegExp: RegExp = new RegExp(`${time2}s?`);
const fromUnitIndex: number = UNIT_CONVERTERS.findIndex(converter => time1RegExp.test(converter.name));
const toUnitIndex: number = UNIT_CONVERTERS.findIndex(converter => time2RegExp.test(converter.name));
let unitRate: number;
if (fromUnitIndex < toUnitIndex) {
    unitRate = rangeArrayFromTo(fromUnitIndex + 1, toUnitIndex).reduce((mul, index) => mul * UNIT_CONVERTERS[index].rate, 1);
} else if (fromUnitIndex === toUnitIndex) {
    unitRate = 1;
} else {
    unitRate = 1 / rangeArrayFromTo(toUnitIndex + 1, fromUnitIndex).reduce((mul, index) => mul * UNIT_CONVERTERS[index].rate, 1);
}

const toSpeed: string = (parseInt(speed) * distanceRate / unitRate).toFixed(1);

const result: string = `${toSpeed} ${dist2} per ${time2}`;

// console.log('The Converted Speed');
console.log(result);
