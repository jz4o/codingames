/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const text: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const step1ReplaceObject: { [key: string]: string } = {
    '??=': '#',
    '??/': '\\',
    "??'": '^',
    '??(': '[',
    '??)': ']',
    '??!': '|',
    '??-': '~',
};
const step1Text: string = text.replace(/\?\?[=/'()!-]/g, match => step1ReplaceObject[match]);

const step2Text: string = step1Text
    .replace(/(?<!\\)(?<charCode>\\x[\da-fA-F]{2}|\\U[\da-fA-F]{8}|\\u[\da-fA-F]{4})/g, match => {
        const replaced: string = String.fromCharCode(parseInt(match.slice(2), 16));

        return replaced === '\\' ? '\\\\' : replaced;
    })
    .replace(/(?<!\\)\\(?<notReplaceChar>.)/g, "$1");

const step3ReplaceObject: { [key: string]: string } = {
    '&lt;': '<',
    '&gt;': '>',
    '&bsol;': '\\',
    '&amp;': '&',
};
const step3Text: string = step2Text
    .replace(/&#(?<charCode>\d+);/g, (_match, capture1) => String.fromCharCode(parseInt(capture1, 10)))
    .replace(/&(?<escapedChar>lt|gt|bsol|amp);/g, match => step3ReplaceObject[match]);

const result: string = step3Text.toString();

// console.log('answer');
console.log(result);
