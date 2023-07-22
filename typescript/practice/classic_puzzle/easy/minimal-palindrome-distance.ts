/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const s: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const result: number = [...Array(n).keys()].find(i => {
    const front: string = s.slice(0, Math.ceil((n + i) / 2) - 1);
    const back: string = s.slice(-(n - Math.ceil((n + i) / 2)));

    const reversedBack: string = back.split('').reverse().join('');

    return front.endsWith(reversedBack);
});

// console.log('answer');
console.log(result);
