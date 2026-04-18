/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const W: number = parseInt(readline(), 10);
const _H: number = parseInt(readline(), 10);
const T: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const wordCounts: number[] = T.split(' ').map(s => parseInt(s, 10));
const word: string = wordCounts.map((wordCount, index) => {
    return (index % 2 === 0 ? '*' : ' ').repeat(wordCount);
}).join('');

const results: string[] = word
    .match(new RegExp(`.{${W}}`, 'g'))
    .map(matched => `|${matched}|`);

// console.log('|********|');
// console.log('|**      |');
// console.log('|    ****|');
results.forEach(result => {
    console.log(result);
});
