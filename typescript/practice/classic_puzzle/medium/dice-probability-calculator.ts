/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const expr: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const uniq: <T>(array: T[]) => T[] = <T>(array: T[]): T[] => {
    return Array.from(new Set(array));
};

const calc: (expr: string) => string = (expr: string): string => {
    let tempExpr: string = expr;
    while (tempExpr.includes('(')) {
        const [parentheses]: string[] = tempExpr.match(/(?<parenthese>\(.*?\))/g);
        tempExpr = tempExpr.replace(parentheses, calc(parentheses.slice(1, -1)));
    }

    const elements: string[] = tempExpr.match(/[*+\->]|\d+/g);

    while (elements.includes('*')) {
        const index: number = elements.indexOf('*');
        const [lStr, _, rStr]: string[] = elements.slice(index - 1, index + 2);
        const [l, r]: number[] = [lStr, rStr].map(s => parseInt(s));

        const result: string = (l * r).toString();

        elements.splice(index - 1, 3, result);
    }

    while (elements.includes('+') || elements.includes('-')) {
        const index: number = elements.findIndex(element => ['+', '-'].includes(element));
        const [lStr, operator, rStr]: string[] = elements.slice(index - 1, index + 2);
        const [l, r]: number[] = [lStr, rStr].map(s => parseInt(s));

        const result: string = (operator === '+' ? l + r : l - r).toString();

        elements.splice(index - 1, 3, result);
    }

    while (elements.includes('>')) {
        const index: number = elements.indexOf('>');
        const [lStr, _, rStr]: string[] = elements.slice(index - 1, index + 2);
        const [l, r]: number[] = [lStr, rStr].map(s => parseInt(s));

        const result: string = (l > r ? 1 : 0).toString();

        elements.splice(index - 1, 3, result);
    }

    return elements[0];
};

const incompleteExprs: string[] = [expr];
const exprs: string[] = [];

while (incompleteExprs.length > 0) {
    const incompleteExpr: string = incompleteExprs.shift();
    if (!incompleteExpr.includes('d')) {
        exprs.push(incompleteExpr);
        continue;
    }

    const [possiblyStr]: string[] = incompleteExpr.match(/d\d/g);
    const possibly: number = parseInt(possiblyStr.replace('d', ''));
    const [front, back]: string[] = incompleteExpr.replace(possiblyStr, ':').split(':');

    rangeArrayFromTo(1, possibly).forEach(i => {
        incompleteExprs.push(`${front}${i}${back}`);
    });
}

const answers: number[] = exprs.map(e => parseInt(calc(e)));
const results: string[] = uniq(answers).sort((a, b) => a - b).map(answer => {
    const answerCount: number = answers.filter(ans => ans === answer).length;
    const percentage: number = (answerCount / answers.length) * 100;

    return `${answer} ${percentage.toFixed(2)}`;
});

// console.log('answer');
results.forEach(result => {
    console.log(result);
});

