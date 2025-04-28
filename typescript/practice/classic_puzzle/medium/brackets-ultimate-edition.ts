/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const expressions: string[] = [];
for (let i = 0; i < N; i++) {
    const expression: string = readline();
    expressions.push(expression);
}
// for (let i = 0; i < N; i++) {
//
//     // Write an answer using console.log()
//     // To debug: console.error('Debug messages...');
//
//     console.log('-1');
// }

const leftElements: string = '([{<';
const rightElements: string = ')]}>';

const bracketsRegexp: RegExp = /[()]{2}|[[\]]{2}|[{}]{2}|[<>]{2}/;
const validBracketsRegexp: RegExp = /\(\)|\[\]|\{\}|<>/;

const results: string[] = expressions.map(expression => {
    let tempExpression: string = expression.replace(/[^()[\]{}<>]/g, '');

    let replaceCount: number = 0;
    while (bracketsRegexp.test(tempExpression)) {
        while (validBracketsRegexp.test(tempExpression)) {
            tempExpression = tempExpression.replace(validBracketsRegexp, '');
        }

        const centerIndex: number = Math.floor(tempExpression.length / 2);
        const backHalfMatched: RegExpMatchArray = tempExpression.slice(centerIndex - 1).match(bracketsRegexp);
        const frontHalfMatched: RegExpMatchArray = tempExpression.match(bracketsRegexp);
        if (!backHalfMatched && !frontHalfMatched) {
            break;
        }

        const matchedIndex: number = backHalfMatched !== null ? backHalfMatched.index + centerIndex - 1 : frontHalfMatched.index;
        const matchedBrackets: string = backHalfMatched !== null ? backHalfMatched[0] : frontHalfMatched[0];

        tempExpression = `${tempExpression.slice(0, matchedIndex)}${tempExpression.slice(matchedIndex + 2)}`;

        const [left, right]: string[] = matchedBrackets.split('');
        if (rightElements.includes(left)) {
            replaceCount++;
        }
        if (leftElements.includes(right)) {
            replaceCount++;
        }
    }

    return (tempExpression.length === 0 ? replaceCount : -1).toString();
});

results.forEach(result => {
    console.log(result);
});
