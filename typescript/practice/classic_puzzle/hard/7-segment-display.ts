/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const C: string = readline();
const S: number = parseInt(readline());

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const SEGMENTS: string[][] = [
    ['t', 'tl', 'tr',      'bl', 'br', 'b'],
    [           'tr',            'br',    ],
    ['t',       'tr', 'c', 'bl',       'b'],
    ['t',       'tr', 'c',       'br', 'b'],
    [     'tl', 'tr', 'c',       'br',    ],
    ['t', 'tl',       'c',       'br', 'b'],
    ['t', 'tl',       'c', 'bl', 'br', 'b'],
    ['t',       'tr',            'br',    ],
    ['t', 'tl', 'tr', 'c', 'bl', 'br', 'b'],
    ['t', 'tl', 'tr', 'c',       'br', 'b'],
];

const getSegmentChar = (num: number, pos: string): string => {
    return SEGMENTS[num].indexOf(pos) !== -1 ? C : ' ';
};

const transpose = array => array[0].map((_value, index) => array.map(row => row[index]));

const results: string[][] = [];
N.toString().split('').forEach(n => {
    const digit: number = parseInt(n);

    const tl: string = getSegmentChar(digit, 'tl').repeat(S);
    const bl: string = getSegmentChar(digit, 'bl').repeat(S);
    results.push(` ${tl} ${bl} `.split(''));

    const t: string = getSegmentChar(digit, 't');
    const c: string = getSegmentChar(digit, 'c');
    const b: string = getSegmentChar(digit, 'b');
    const tcb: string = [t, c, b].join(' '.repeat(S));
    Array(S).fill(null).forEach(() => results.push(tcb.split('')));

    const tr: string = getSegmentChar(digit, 'tr').repeat(S);
    const br: string = getSegmentChar(digit, 'br').repeat(S);
    results.push(` ${tr} ${br} `.split(''));

    results.push(' '.repeat(S * 2 + 3).split(''));
});

// console.log('answer');
transpose(results)
    .map(result => result.join('').replace(/\s+$/, ''))
    .map(result => console.log(result));
