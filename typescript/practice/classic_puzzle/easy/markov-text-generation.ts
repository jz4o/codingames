/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const t: string = readline();
const d: number = parseInt(readline());
const l: number = parseInt(readline());
const s: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const markovChain: { [key: string]: string[] } = {};
const tWords: string[] = t.split(' ');
[...Array(tWords.length - d).keys()].forEach(i => {
    const words: string[] = tWords.slice(i, i + d + 1);

    const markovValue: string = words.pop();
    const markovKey: string = words.join(' ');

    if (!(markovKey in markovChain)) {
        markovChain[markovKey] = [];
    }
    markovChain[markovKey].push(markovValue);
});

const sWords: string[] = s.split(' ');
[...Array(l - sWords.length).keys()].forEach(i => {
    const randomSeed = (i + 1) * 7;

    const markovKey: string = sWords.slice(sWords.length - d).join(' ');
    const markovValues: string[] = markovChain[markovKey];

    const nextWord: string = markovValues[randomSeed % markovValues.length];

    sWords.push(nextWord);
});

const result: string = sWords.join(' ');

// console.log('fish is bad and');
console.log(result);
