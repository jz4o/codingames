/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const lines: string[] = [];
for (let i = 0; i < 3; i++) {
    const line: string = readline(); // One line out of three in the string describing the arrangement of the numbers.
    lines.push(line);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

let [a, b, c, d, e, f]: number[] = lines.join('').replace(/\s/g, '').split('').map(c => parseInt(c));

const isCheckVersusFaces: boolean = [a + f, b + d, c + e].every(sumValue => sumValue === 7);
const isCheckFaceValues: boolean = [a, b, c, d, e, f].sort().join('') === '123456';
const isNotDegenerate: boolean = isCheckVersusFaces && isCheckFaceValues;

let result: string;
if (isNotDegenerate) {
    const isTurnOver: boolean = a >= 4;
    if (isTurnOver) {
        [a, f] = [f, a];
    }

    if (c >= 4) {
        [b, c, d, e] = [d, e, b, c];
    }

    const isLeftHanded =  [a, b, c, d, e, f].filter(face => face <= 3).join('').repeat(2).includes('123') === isTurnOver;
    result = isLeftHanded ? 'left-handed' : 'right-handed';
} else {
    result = 'degenerate';
}

// Output one of "right-handed", "left-handed" and "degenerate".
// console.log('handedness');
console.log(result);
