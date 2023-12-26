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
for (let i = 0; i < N; i++) {

    // Write an answer using console.log()
    // To debug: console.error('Debug messages...');

    const expression: string = expressions[i];

    let brackets: string = expression
        .match(/[()[\]{}<>]/g)
        .join('')
        .replace(/\(/g, ')')
        .replace(/\[/g, ']')
        .replace(/{/g, '}')
        .replace(/</g, '>');

    const replaceRegexp: RegExp = /\)\)|]]|}}|>>/g;
    while (replaceRegexp.test(brackets)) {
        brackets = brackets.replace(replaceRegexp, '');
    }

    const result: string = (brackets.length === 0).toString();

    // console.log('true');
    console.log(result);
}
