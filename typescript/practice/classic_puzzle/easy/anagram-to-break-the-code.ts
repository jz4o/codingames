/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const w: string = readline();
const s: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const zip: <T, U>(a: T[], b: U[]) => [T, U][] = <T, U>(a: T[], b: U[]): [T, U][] => {
    const arraySize: number = Math.max(a.length, b.length);
    return [...Array(arraySize).keys()].map(index => {
        return [a[index], b[index]];
    });
};

const words: string[] = s.toLowerCase().replace(/[:.,?!]/g, ' ').split(' ').filter(word => word);
const sortedWords: string[] = words.map(word => word.split('').sort().join(''));

const lowerCaseW: string = w.toLowerCase();
const sortedW: string = lowerCaseW.split('').sort().join('');

const keyIndex: number = zip(words, sortedWords).findIndex(([word, sortedWord]) => word !== lowerCaseW && sortedWord === sortedW);

const results: string[] = [];
if (keyIndex !== -1) {
    results.push((keyIndex % 10).toString());
    results.push(((sortedWords.length - keyIndex - 1) % 10).toString());
    results.push((sortedWords.slice(0, keyIndex).reduce((sum, word) => sum + word.length, 0) % 10).toString());
    results.push((sortedWords.slice(keyIndex + 1).reduce((sum, word) => sum + word.length, 0) % 10).toString());
} else {
    results.push('IMPOSSIBLE');
}

const result: string = results.join('.');

// console.log('answer');
console.log(result);
