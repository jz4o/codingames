/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

interface Pattern {
    numbers: number[];
    count: number;
    score: number;
}

const rangeArrayFromTo = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
}

const TARGET_SCORE: number = 50;
const POSSIBLE_ROUNDS: number = 4;

let result: number = 0;
const patterns: {[key: string]: Pattern} = {};
patterns[n.toString()] = {
    numbers: [n],
    count: 1,
    score: n
};

while (Object.keys(patterns).length > 0) {
    const key: string = Object.keys(patterns).shift();
    const pattern: Pattern = patterns[key];

    // between 2 and 12 is 2 patterns for PN and N
    [1, ...rangeArrayFromTo(2, 12), ...rangeArrayFromTo(2, 12)].forEach(i => {
        const newNumbers: string = [...pattern.numbers, i].sort().join(' ');

        if (patterns[newNumbers]) {
            patterns[newNumbers].count += pattern.count;
        } else {
            patterns[newNumbers] = {
                numbers: [...pattern.numbers, i],
                count: pattern.count,
                score: pattern.score + i
            };
        }
    });

    // delete pattern for over score or over rounds
    Object.keys(patterns).filter(k => patterns[k].score > TARGET_SCORE || patterns[k].numbers.length > POSSIBLE_ROUNDS + 1)
                         .forEach(k => delete patterns[k]);

    // add possible pattern to result
    Object.keys(patterns).filter(k => patterns[k].score === TARGET_SCORE)
                         .forEach(k => {
                             result += patterns[k].count;
                             delete patterns[k];
                         });

    delete patterns[key];
}

// console.log('answer');
console.log(result);
