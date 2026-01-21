/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const username: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const coreSeed: number = (username.split('').reduce((sum, char) => sum + char.charCodeAt(0), 0) * username.length) ^ 20480;

const segment1: number = coreSeed & 65535;
const segment2: number = coreSeed >> 16;
const segment3: number = (username.charCodeAt(0) + username.at(-1).charCodeAt(0)) * username.length;
const segment4: number = (segment1 + segment2 + segment3) % 65536;

const serialSegments: string[] = [segment1, segment2, segment3, segment4].map(segment => segment.toString(16).padStart(4, '0'));

const result: string = serialSegments.join('-').toUpperCase();

// console.log('Serial Key');
console.log(result);
