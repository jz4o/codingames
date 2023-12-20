/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const lines: string[] = [];
for (let i = 0; i < N; i++) {
    const line: string = readline();
    lines.push(line);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type IndentCombination = {
    indent: number,
    combination: number
};

const ifElements: string[] = lines.filter(line => ['if', 'else', 'endif'].includes(line));

let indent: number = 0;
const stack: IndentCombination[] = [];
[...ifElements].reverse().forEach(ifElement => {
    if (ifElement === 'if') {
        let value: number = 1;
        while (stack.length !== 0 && stack[stack.length - 1].indent === indent) {
            value *= stack.pop().combination;
        }

        value += stack.pop().combination;

        indent--;

        stack.push({ indent: indent, combination: value });
    } else if (ifElement === 'else') {
        let value: number = 1;
        while (stack.length !== 0 && stack[stack.length - 1].indent === indent) {
            value *= stack.pop().combination;
        }

        stack.push({ indent: indent - 1, combination: value });
    } else if (ifElement === 'endif') {
        indent++;
    }
});

const result: number = stack.reduce((result, indentCombination) => result * indentCombination.combination, 1);

// console.log('answer');
console.log(result);
