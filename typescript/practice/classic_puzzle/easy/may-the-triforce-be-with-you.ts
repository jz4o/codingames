/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const width: number = N * 4 - 1;

let upperPart: string = '';
let lowerPart: string = '';
for (let i = 1; i <= N; i++) {
    const part: string = '*'.repeat(i * 2 - 1);

    const upperLeftSpacePart: string = ' '.repeat((width - part.length) / 2);
    upperPart += `${upperLeftSpacePart}${part}\n`;

    const lowerSpacePart: string = ' '.repeat((N - i + 1) * 2 - 1);
    const lowerLine: string = `${part}${lowerSpacePart}${part}`;
    const lowerLeftSpacePart: string = ' '.repeat((width - lowerLine.length) / 2);
    lowerPart += `${lowerLeftSpacePart}${lowerLine}\n`;
}

const result: string = `${upperPart.replace(' ', '.')}${lowerPart}`.trim();

// console.log('answer');
console.log(result);
