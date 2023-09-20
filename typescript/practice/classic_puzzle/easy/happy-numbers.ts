/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const xs: string[] = []
for (let i = 0; i < N; i++) {
    const x: string = readline();

    xs.push(x);
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const HAPPY_NUMBER: string = '1';
const HAPPY_FACE: string = ':)';
const UNHAPPY_FACE: string = ':(';

const results: string[] = []
for (const x of xs) {
    let temp: string = x;

    const exitNumbers: string[] = [HAPPY_NUMBER];
    while (!exitNumbers.includes(temp)) {
        exitNumbers.push(temp);
        temp = temp.split('').map(d => parseInt(d) ** 2).reduce((sum, d) => sum + d, 0).toString();
    }

    const resultFace = temp === HAPPY_NUMBER ? HAPPY_FACE : UNHAPPY_FACE;
    results.push(`${x} ${resultFace}`);
}

// console.log('23 :)');
for (const result of results) {
    console.log(result);
}

