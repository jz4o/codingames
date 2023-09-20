/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const text: string = readline();
const format: string = readline();

const regexpFormat: string = format
    .replace(/\\/g, '\\\\')
    .replace(/\^/g, '\\^')
    .replace(/\*/g, '\\*')
    .replace(/\(/g, '\\(')
    .replace(/\)/g, '\\)')
    .replace(/\[/g, '\\[')
    .replace(/\]/g, '\\]')
    .replace(/\$/g, '\\$')
    .replace(/\?/g, '.')
    .replace(/~/g, '.*');

console.log(text.match(new RegExp(regexpFormat)) ? 'MATCH' : 'FAIL');

