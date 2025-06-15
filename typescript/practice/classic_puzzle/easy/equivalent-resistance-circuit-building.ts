/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const inputRows: [string, number][] = [];
for (let i = 0; i < N; i++) {
    const [name, rStr]: string[] = readline().split(' ');
    const R: number = parseInt(rStr);

    inputRows.push([name, R]);
}
const circuit: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const calcSeries: (rs: string[]) => number = (rs: string[]): number => {
    return rs.reduce((sum, r) => sum + parseFloat(r), 0);
};

const calcParallel: (rs: string[]) => number = (rs: string[]): number => {
    return 1 / rs.reduce((sum, r) => sum + (1 / parseFloat(r)), 0);
};

const LEFT_PARTS: string = '[(';
const RIGHT_PARTS: string = '])';

const replacedCircuit: string = inputRows.reduce((tempCircuit, [name, r]) => tempCircuit.replace(new RegExp(name, 'g'), r.toString()), circuit);

const circuitElements: string[] = replacedCircuit.split(' ');
while (circuitElements.length >= 2) {
    const lastLeftPartIndex: number = circuitElements.length - 1 - [...circuitElements].reverse().findIndex(circuit => LEFT_PARTS.includes(circuit));
    const pairRightPartIndex: number = lastLeftPartIndex + circuitElements.slice(lastLeftPartIndex).findIndex(circuit => RIGHT_PARTS.includes(circuit));

    const lastLeftPart: string = circuitElements[lastLeftPartIndex];

    const calcFunction: (rs: string[]) => number = lastLeftPart === '[' ? calcParallel : calcSeries;
    const r: number = calcFunction(circuitElements.slice(lastLeftPartIndex + 1, pairRightPartIndex));

    circuitElements.splice(lastLeftPartIndex, pairRightPartIndex - lastLeftPartIndex + 1, r.toString());
}

const equivalentResistance: number = parseFloat(circuitElements[0]);
const result : string = equivalentResistance.toFixed(1);

// console.log('Equivalent Resistance');
console.log(result);

