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

type Replacer = {
    from: string,
    to: string
};

const joinedLines: string = lines.join('\n');

let choiceCount: number = 0;
const replacers: Replacer[] = joinedLines.match(/\((.|\s)*?\)/g).map(choiceText => {
    const choices: string[] = choiceText.replace(/\(|\)/g, '').split('|');
    const choiced: string = choices[choiceCount % choices.length];

    choiceCount++;

    return { from: choiceText, to: choiced };
});

const results: string[] = replacers.reduce((result, replacer) => result.replace(replacer.from, replacer.to), joinedLines).split('\n');

// console.log('42');
results.forEach(result => {
    console.log(result);
})
