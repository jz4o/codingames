/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const _W: number = parseInt(inputs[0]);
const H: number = parseInt(inputs[1]);
const grid: string[][] = [];
for (let i = 0; i < H; i++) {
    const line: string = readline();

    grid.push([' ', ...line.split('').filter((char, index, array) => char !== array[index + 1])]);
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const topLine: string[] = grid.shift();
const bottomLine: string[] = grid.pop();

for (const line of grid.reverse()) {
    line.forEach((char, index) => {
        if (char === '-') {
            [bottomLine[index - 1], bottomLine[index + 1]] = [bottomLine[index + 1], bottomLine[index - 1]];
        }
    });
}

const results:string[] = topLine.reduce((result, char, index) => {
    if (char !== ' ') {
        result.push(`${char}${bottomLine[index]}`);
    }

    return result;
}, []);

// console.log('answer');
for (const result of results) {
    console.log(result);
}

