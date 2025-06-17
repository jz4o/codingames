/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const ip: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const longestOmit: string = ip
    .match(/(?<omitable>0000(?::0000)+)/g)
    ?.reduce((longestOmit, omit) => longestOmit.length < omit.length ? omit : longestOmit);

const result: string = ip
    .replace(longestOmit, ':')
    .replace(':::', '::')
    .replace(/^0+/g, '0')
    .replace(/:0+/g, ':0')
    .replace(/:0(?<validValue>[1-9a-f])/g, ':$<validValue>');

// console.log('output');
console.log(result);

