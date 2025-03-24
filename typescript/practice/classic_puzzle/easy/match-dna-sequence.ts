/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const delta: number = parseInt(readline());
const gene: string = readline();
const n: number = parseInt(readline());
const chrs: string[] = [];
for (let i = 0; i < n; i++) {
    const chr: string = readline();
    chrs.push(chr);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const matches: string[] = chrs.flatMap((chr, chrIndex) => {
    return [...Array(chr.length - gene.length + delta + 1).keys()].map(startIndex => {
        const diffCount: number = [...Array(gene.length).keys()].filter(index => gene[index] !== chr[startIndex + index]).length;

        return diffCount <= delta ? `${chrIndex} ${startIndex} ${diffCount}` : null;
    }).filter(match => match !== null);
});

const result: string = matches[0] || 'NONE';

// console.log('line index delta');
console.log(result);
