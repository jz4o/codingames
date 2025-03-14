/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const rawtime: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const [_, hh, mm, ss, utcSign, utcHh, utcMm]: string[] = rawtime.match(/(\d{2}):(\d{2}):(\d{2})\sUTC([+-])(\d{2}):(\d{2})/);
const rawSeconds: number = parseInt(hh) * 3600 + parseInt(mm) * 60 + parseInt(ss);

const utcMinutes: number = (parseInt(utcHh) * 60 + parseInt(utcMm)) * (utcSign === '+' ? 1 : -1);
const bielDiffSeconds: number = (60 - utcMinutes) * 60;
const daySeconds: number = 60 * 60 * 24;
const bielSeconds: number = (rawSeconds + bielDiffSeconds) < 0
    ? (rawSeconds + bielDiffSeconds) % daySeconds + daySeconds
    : (rawSeconds + bielDiffSeconds) % daySeconds;

const beats: number = bielSeconds / 864 * 10;

const result: string = `@${beats.toFixed(2)}`;

// console.log('answer');
console.log(result);
