/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const words: string[] = [];
for (let i = 0; i < N; i++) {
    const W: string = readline();

    words.push(W);
}
const LETTERS: string = readline();

// Write an action using console.log()
// To debug: console.error('Debug messages...');

interface Result {
    bestWord: string;
    maxPoint: number;
}

const POINTS: {[key: string]: number} = {};
['e', 'a', 'i', 'o', 'n', 'r', 't', 'l', 's', 'u'].forEach(c => POINTS[c] = 1);
['d', 'g'].forEach(c => POINTS[c] = 2);
['b', 'c', 'm', 'p'].forEach(c => POINTS[c] = 3);
['f', 'h', 'v', 'w', 'y'].forEach(c => POINTS[c] = 4);
['k'].forEach(c => POINTS[c] = 5);
['j', 'x'].forEach(c => POINTS[c] = 8);
['q', 'z'].forEach(c => POINTS[c] = 10);

const result: Result = words.reduce((result, word) => {
    let chars: string = String(LETTERS);
    const madeFlag: boolean = word.split('').every(w => {
        const include = chars.includes(w);
        chars = chars.replace(w, '');

        return include;
    });

    if (!madeFlag) {
        return result;
    }

    const point: number = word.split('').reduce((point, w) => point + POINTS[w], 0);

    if (result.maxPoint < point) {
        result.bestWord = word;
        result.maxPoint = point;
    }

    return result;
}, {bestWord: '', maxPoint: 0});

// console.log('invalid word');
console.log(result.bestWord);
