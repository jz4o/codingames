/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const m: number = parseInt(readline());
const inputSignals: { [key: string]: string } = {};
for (let i = 0; i < n; i++) {
    const [inputName, inputSignal]: string[] = readline().split(' ');

    inputSignals[inputName] = inputSignal;
}
const outputLines: [string, string, string, string][] = [];
for (let i = 0; i < m; i++) {
    const [outputName, type, inputName1, inputName2]: string[] = readline().split(' ');

    outputLines.push([outputName, type, inputName1, inputName2]);
}
for (let i = 0; i < m; i++) {

    // Write an answer using console.log()
    // To debug: console.error('Debug messages...');

    const [outputName, type, inputName1, inputName2]: [string, string, string, string] = outputLines[i];

    const inputSignal1: string = inputSignals[inputName1];
    const inputSignal2: string = inputSignals[inputName2];

    const signalChars: [string, string][] = [...Array(inputSignal1.length).keys()].map(j => {
        const inputSignal1Char: string = inputSignal1.charAt(j);
        const inputSignal2Char: string = inputSignal2.charAt(j);

        return [inputSignal1Char, inputSignal2Char];
    });

    let output: string;
    if (type === 'AND') {
        output = signalChars.map(chars => chars.every(c => c === '-') ? '-' : '_').join('');
    } else if (type === 'OR') {
        output = signalChars.map(chars => chars.some(c => c === '-') ? '-' : '_').join('');
    } else if (type === 'XOR') {
        output = signalChars.map(chars => [...new Set(chars)].length === chars.length ? '-' : '_').join('');
    } else if (type === 'NAND') {
        output = signalChars.map(chars => chars.every(c => c === '-') ? '_' : '-').join('');
    } else if (type === 'NOR') {
        output = signalChars.map(chars => chars.some(c => c === '-') ? '_' : '-').join('');
    } else if (type === 'NXOR') {
        output = signalChars.map(chars => [...new Set(chars)].length === chars.length ? '_' : '-').join('');
    }

    const result: string = `${outputName} ${output}`;

    // console.log('output name and signal');
    console.log(result);
}

