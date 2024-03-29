/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const W: number = parseInt(readline());
const _H: number = parseInt(readline());
const T: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const wordCounts: number[] = T.split(' ').map(s => parseInt(s));
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
