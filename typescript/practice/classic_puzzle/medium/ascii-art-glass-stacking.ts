/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
};

let stage: number = 0;
let glassCount: number = 0;
while ((glassCount += stage + 1) <= N) {
    stage++;
}

const GLASS_PARTS: string[] = [
    ' *** ',
    ' * * ',
    ' * * ',
    '*****'
];

const WIDTH: number = stage * GLASS_PARTS[0].length + stage - 1;

const results: string[] = [];
rangeArrayFromTo(1, stage).forEach(step => {
    GLASS_PARTS.forEach(glassPart => {
        const result: string = Array(step).fill(glassPart).join(' ');
        const leftSpace: string = ' '.repeat(Math.trunc((WIDTH - result.length) / 2));
        const rightSpace: string = ' '.repeat(WIDTH - result.length - leftSpace.length);

        results.push(`${leftSpace}${result}${rightSpace}`);
    });
});

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
