/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const X: number = parseInt(readline());
let charGrid: string[][] = [];
for (let i = 0; i < N; i++) {
    const LINE: string = readline();

    charGrid.push(LINE.split(''));
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const transpose = array => array[0].map((_value, index) => array.map(row => row[index]));

// array to strign
charGrid = transpose(charGrid);
let charStr: string = charGrid.reduce((result, row, index) => {
    return `${result}${(index % 2 === 0 ? row.reverse() : row).join('')}`;
}, '');

// rotate char(s)
const rotateBeginIndex: number = charStr.length - X;
const rotateEndIndex: number = rotateBeginIndex + charStr.length;
charStr = charStr.repeat(2).substring(rotateBeginIndex, rotateEndIndex);

// string to array
charGrid = charStr.match(new RegExp(`.{${N}}`, 'g')).map(row => row.split(''));
charGrid = charGrid.map((row, index) => index % 2 === 0 ? row.reverse() : row);
charGrid = transpose(charGrid);

// print answer
// console.log('answer');
charGrid.forEach(row => {
    console.log(row.join(''));
});
