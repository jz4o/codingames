/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const ms: string[] = [];
for (let i = 0; i < n; i++) {
    const m: string = readline();
    ms.push(m);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Mass = {
    rowIndex: number,
    columnIndex: number,
    value: string
};

const massGrid: Mass[][] = ms.map((row, rowIndex) => {
    return row.split('').map((value, columnIndex) => {
        return { rowIndex, columnIndex, value };
    });
});

const candidateMassArrays: Mass[][] = massGrid
    .flat()
    .map(mass => mass.value === 'a' ? [mass] : null)
    .filter(mass => mass);

let resultArray: Mass[];
let candidateMassArray: Mass[];
while ((candidateMassArray = candidateMassArrays.shift()) !== undefined) {
    const lastMass: Mass = candidateMassArray[candidateMassArray.length - 1];

    if (lastMass.value === 'z') {
        resultArray = candidateMassArray;
        break;
    }

    const targetValue: string = String.fromCharCode(lastMass.value.charCodeAt(0) + 1);

    const aroundLastMasses: Mass[] = [
        (lastMass.rowIndex > 0 ? massGrid[lastMass.rowIndex - 1][lastMass.columnIndex] : null),
        (lastMass.columnIndex > 0 ? massGrid[lastMass.rowIndex][lastMass.columnIndex - 1] : null),
        (lastMass.columnIndex + 1 < massGrid[lastMass.rowIndex].length ? massGrid[lastMass.rowIndex][lastMass.columnIndex + 1] : null),
        (lastMass.rowIndex + 1 < massGrid.length ? massGrid[lastMass.rowIndex + 1][lastMass.columnIndex] : null)
    ].filter(mass => mass);

    const nextCandidateMassArrays: Mass[][] = aroundLastMasses
        .filter(mass => mass.value ===targetValue)
        .map(mass => candidateMassArray.concat(mass));

    candidateMassArrays.push(...nextCandidateMassArrays);
}

const resultGrid: string[][] = [...Array(n).keys()].map(() => Array(n).fill('-'));
resultArray.forEach(mass => {
    resultGrid[mass.rowIndex][mass.columnIndex] = mass.value;
});

const results: string[] = resultGrid.map(row => row.join(''));

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
