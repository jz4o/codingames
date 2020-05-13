/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const phrase: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const ALPHABETS: string[] = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');

const getAlphabetsEveryBy = (num: number): string[] => {
    return ALPHABETS.filter((_, index) => (index + 1) % num === 0);
}

const getIndexes = (str: string, searchArray: string[]): number[] => {
    return str.split('').map((char, index) => {
        return searchArray.indexOf(char) !== -1 ? index : null;
    }).filter(index => index !== null);
}

const partShift = (str: string, indexes: number[]): string => {
    indexes.forEach((indexInStr, index) => {
        if (index === indexes.length - 1) {
            return;
        }

        const nextIndexInStr: number = indexes[index + 1];
        const left: number = Math.min(indexInStr, nextIndexInStr);
        const right: number = Math.max(indexInStr, nextIndexInStr);

        str = str.replace(new RegExp(`(.{${left}})(.)(.{${right - left - 1}})(.)`), '$1$4$3$2');
    });

    return str;
}

const partUnshift = (str: string, indexes: number[]): string => {
    return partShift(str, indexes.reverse());
}

const partReverse = (str: string, indexes: number[]): string => {
    while (indexes.length >= 2) {
        const shiftIndex: number = indexes.shift();
        const popIndex: number = indexes.pop();

        const left: number = Math.min(shiftIndex, popIndex);
        const right: number = Math.max(shiftIndex, popIndex);

        str = str.replace(new RegExp(`(.{${left}})(.)(.{${right - left - 1}})(.)`), '$1$4$3$2');
    }

    return str;
}

// # reverse word length
const sizeOfWords: number[] = phrase.split(' ').map(word => word.length);
const phraseChars: string[] = phrase.replace(/\s/g, '').split('');
const words: string[] = sizeOfWords.reverse().map(sizeOfWord => {
    return phraseChars.splice(0, sizeOfWord - 0).join('');
});
let tempPhrase: string = words.join(' ');

// unshift every 4th alphabets
tempPhrase = partUnshift(tempPhrase, getIndexes(tempPhrase, getAlphabetsEveryBy(4)));

// shift every 3rd alphabets
tempPhrase = partShift(tempPhrase, getIndexes(tempPhrase, getAlphabetsEveryBy(3)));

// reverse every 2nd alphabets
tempPhrase = partReverse(tempPhrase, getIndexes(tempPhrase, getAlphabetsEveryBy(2)));

// console.log('answer');
console.log(tempPhrase);
