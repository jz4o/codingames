/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const lengthofline: number = parseInt(readline());
const N: number = parseInt(readline());
const entries: string[] = [];
for (let i = 0; i < N; i++) {
    const entry: string = readline();
    entries.push(entry);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const INDENT: string = '    ';

const sectionNumbers: number[] = [];
const results: string[] = entries.map(entry => {
    const [content, page]: string[] = entry.split(' ');

    const [indentStr]: string[] = content.match(/^>+/) || [''];
    const indentLevel: number = indentStr.length;
    const indent: string = INDENT.repeat(indentLevel);

    if (sectionNumbers.length <= indentLevel) {
        sectionNumbers.push(0);
    }
    sectionNumbers[indentLevel]++;
    sectionNumbers.splice(indentLevel + 1);
    const section: string = `${sectionNumbers[indentLevel]} `;

    const title: string = content.replace(indentStr, '');

    const dotCount: number = lengthofline - indent.length - section.length - title.length - page.length;
    const dots: string = '.'.repeat(dotCount);

    return `${indent}${section}${title}${dots}${page}`;
});

// console.log('Format error');
results.forEach(result => {
    console.log(result);
});
