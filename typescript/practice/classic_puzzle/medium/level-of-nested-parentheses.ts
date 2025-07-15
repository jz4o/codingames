/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const f: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

interface Parentheses {
    beginIndex: number;
    endIndex: number;
    level: number;
}

const indexStack: number[] = [];
const parenthesesArray: Parentheses[] = [];
f.split('').forEach((c, index) => {
    if (c === '(') {
        indexStack.push(index);
    } else if (c === ')') {
        const level: number = indexStack.length;
        const beginIndex: number = indexStack.pop();

        parenthesesArray.push({ beginIndex, endIndex: index, level });
    }
});

const maxLevel: number = Math.max(...parenthesesArray.map(parentheses => parentheses.level), 0);

const outputGrid: string[][] = [];
outputGrid.push(f.split(''));
if (maxLevel > 0) {
    [...Array(maxLevel + 2).keys()].forEach(() => {
        outputGrid.push(Array(f.length).fill(' '));
    });
}

parenthesesArray.forEach(({ beginIndex, endIndex, level }) => {
    const nestedParenthesesArray: Parentheses[] = parenthesesArray.filter(parentheses => {
        return beginIndex <= parentheses.beginIndex && parentheses.beginIndex <= endIndex;
    });
    const nestLevel: number = Math.max(...nestedParenthesesArray.map(parentheses => parentheses.level), 0);

    const arrowHeadRowIndex: number = 1;
    const arrowShaftBeginRowIndex: number = 2;
    const arrowShaftEndRowIndex: number = nestLevel - level + 2;
    const levelRowIndex: number = nestLevel - level + 3;

    [beginIndex, endIndex].forEach(index => {
        outputGrid[arrowHeadRowIndex][index] = '^';
        rangeArrayFromTo(arrowShaftBeginRowIndex, arrowShaftEndRowIndex).forEach(arrowShaftRowIndex => {
            outputGrid[arrowShaftRowIndex][index] = '|';
        });
        outputGrid[levelRowIndex][index] = level.toString();
    });

    rangeArrayFromTo(beginIndex + 1, endIndex - 1).forEach(i => {
        outputGrid[levelRowIndex][i] = '-';
    });
});

const results: string[] = outputGrid.map(row => {
    return row.join('');
});

// console.log('solution');
results.forEach(result => {
    console.log(result);
});

