/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

var inputs: string[] = readline().split(' ');
const H: number = parseInt(inputs[0]);
const W: number = parseInt(inputs[1]);
const lines: string[] = [];
for (let i = 0; i < H; i++) {
    const line: string = readline();
    lines.push(line);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Girl = {
    y: number,
    x: number,
    probability: number
};

const girls: Girl[] = lines.flatMap((line, lineIndex) => {
    return line.split('').map((char, charIndex) => {
        if (char !== 'G') {
            return null;
        }

        const probability: number = Math.min(lineIndex, charIndex) / (Math.pow(lineIndex, 2) + Math.pow(charIndex, 2) + 1);
        const girl: Girl =  { y: lineIndex, x: charIndex, probability };

        return girl;
    });
})
.filter(girl => girl)
.sort((a, b) => a.probability - b.probability);

let notCatchingProbability: number = 1;
const CATCHING_BORDER: number = 0.6;

let girlCount: number = 0;
girls.some(girl => {
    notCatchingProbability *= (1 - girl.probability);
    if (notCatchingProbability < CATCHING_BORDER) {
        return true;
    }

    girlCount++;
});

const result: string = girlCount.toString();

// console.log('max_girls');
console.log(result);
