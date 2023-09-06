/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const T: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const abbreviations: { [key: string]: string } = {
    'sp': ' ',
    'bS': '\\',
    'sQ': "'",
    'nl': '\n',
};

const chars: string[] = T.replace(/nl/g, '1nl').split(' ').flatMap(chunk => {
    const [_, strCount, char]: string[] = /^(\d+)(.+?)$/.exec(chunk);
    const count: number = parseInt(strCount);

    return Array(count).fill(abbreviations[char] || char);
});

const result: string = chars.join('');

// console.log('answer');
console.log(result);
