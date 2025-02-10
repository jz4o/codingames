/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const inputLines: string[] = [];
for (let i = 0; i < N; i++) {
    const LINES: string = readline();
    inputLines.push(LINES);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const correspondObject: {[key: string]: string[]} = {};

inputLines.forEach(line => {
    const words: string[] = line.split(', ');
    words.forEach(word => {
        const otherWords: string[] = words.filter(w => w !== word);
        const regexpWord: RegExp = new RegExp(word.split('').join('.*?'));

        const kangaroos: string[] = otherWords.filter(otherWord => regexpWord.test(otherWord));
        kangaroos.forEach(kangaroo => {
            const prevValues: string[] = correspondObject[kangaroo] || [];
            correspondObject[kangaroo] = [...prevValues, word];
        });
    });
});

const sortedCorrespondKeys: string[] = Object.keys(correspondObject).sort();

const results: string[] = sortedCorrespondKeys.length === 0
    ? ['NONE']
    : sortedCorrespondKeys.map(key => `${key}: ${correspondObject[key].join(', ')}`);

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
