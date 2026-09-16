/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const _frameLength: number = parseInt(readline(), 10);
const frame: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const FRAME_HEADER: string = 'DECAFBAD';

const orderRegexp: RegExp = new RegExp(`(?<header>.{${FRAME_HEADER.length}})(?<size>.{3})(?<order>.+?)(?<checksum>.)$`);
const { header, size, order, checksum: _checksum } = frame.match(orderRegexp)?.groups || {};

const isValidHeader: boolean = header === FRAME_HEADER;
const isValidSize: boolean = parseInt(size, 16) === (order || '').length;
const isValidChecksum: boolean = frame.split('').reduce((sum, c) => sum + parseInt(c, 16), 0) % 16 === 0;
const isValid: boolean = isValidHeader && isValidSize && isValidChecksum;

const results: string[] = isValid
    ? [...new Set(order.split(''))].map(o => `${order.split('').filter(e => e === o).length} ${o}`)
    : ['403 Forbidden'];

// console.log('0xC0FFEE');
results.forEach(result => {
    console.log(result);
});
