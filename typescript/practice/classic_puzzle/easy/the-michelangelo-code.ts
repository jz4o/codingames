/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const TEXT: string = readline();
const N: number = parseInt(readline(), 10);
const words: string[] = [];
for (let i = 0; i < N; i++) {
    const WORD: string = readline();
    words.push(WORD);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArray: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    if (step > 0 && from <= to) {
        return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
    } else if (step < 0 && from >= to) {
        return [...Array(Math.floor((from - to + Math.abs(step)) / Math.abs(step))).keys()].map(i => from + i * step);
    } else {
        return [];
    }
};

const ALPHABETS: string = 'abcdefghijklmnopqrstuvwxyz';

const textChars: string[] = TEXT.toLowerCase().split('').filter(char => ALPHABETS.includes(char));
const textCharCount: { [key: string]: number } = {};
ALPHABETS.split('').forEach(alphabet => {
    textCharCount[alphabet] = textChars.filter(char => char === alphabet).length;
});

const sortedWords: string[] = words.sort((a, b) => b.length - a.length);

let result: string = null;
sortedWords.some(word => {
    const wordCharCount: { [key: string]: number } = {};
    [...new Set(word)].forEach(char => {
        wordCharCount[char] = word.split('').filter(c => c === char).length;
    });

    if (!Object.entries(wordCharCount).every(([char, count]) => count <= textCharCount[char] || 0)) {
        return false;
    }

    const firstChar: string = word.at(0);
    const lastChar: string = word.at(-1);
    const wordLength: number = word.length;

    const firstCharIndexes: number[] = textChars.flatMap((char, index) => char === firstChar ? index : []);
    const lastCharIndexes: number[] = textChars.flatMap((char, index) => char === lastChar ? index : []);

    return firstCharIndexes.some(firstCharIndex => {
        return lastCharIndexes.some(lastCharIndex => {
            if (lastCharIndex <= firstCharIndex) {
                return false;
            }

            const step: number = (lastCharIndex - firstCharIndex) / (wordLength - 1);
            if (step !== Math.floor(step)) {
                return false;
            }

            const indexes: number[] = rangeArray(firstCharIndex, lastCharIndex, step);
            if (indexes.map(index => textChars[index]).join('') !== word) {
                return false;
            }

            const secretMessageChars: string[] = textChars.map((char, index) => {
                return indexes.includes(index) ? char.toUpperCase() : char;
            });
            const secretMessage: string = secretMessageChars.slice(firstCharIndex, lastCharIndex + 1).join('');

            result = secretMessage;

            return true;
        });
    });
});

// console.log('answer');
console.log(result);
