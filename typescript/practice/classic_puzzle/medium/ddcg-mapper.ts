/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const L: number = parseInt(readline());
const N: number = parseInt(readline());
const patterns: number[] = [];
const tempos: number[] = [];
for (let i = 0; i < N; i++) {
    const [pattern, tempoStr]: string[] = readline().split(' ');
    const tempo: number = parseInt(tempoStr);

    patterns.push(parseInt(pattern.replace(/X/g, '1'), 2));
    tempos.push(tempo);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
};

const repeatStr = (str: string, count: number): string => {
    return Array(count + 1).join(str);
};

const zeroPadLeft = (str: string, length: number): string => {
    return `${repeatStr('0', length)}${str}`.substr(length * -1);
};

const results: string[] = [];
rangeArrayFromTo(1, L).forEach(l => {
    let resultNumber: number = 0;
    tempos.forEach((tempo, index) => {
        if (l % tempo === 0) {
            resultNumber |= patterns[index];
        }
    });

    const result: string = zeroPadLeft(resultNumber.toString(2), 4).replace(/1/g, 'X');
    results.unshift(result);
});

// console.log('answer');
results.forEach(result => {
    console.log(result);
});

