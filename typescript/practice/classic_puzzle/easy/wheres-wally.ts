/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs1: string[] = readline().split(' ');
const wallyWidth: number = parseInt(inputs1[0]);
const wallyHeight: number = parseInt(inputs1[1]);
const wallyRows: string[] = [];
for (let i = 0; i < wallyHeight; i++) {
    const wallyRow: string = readline();
    wallyRows.push(wallyRow);
}
const inputs2: string[] = readline().split(' ');
const pictureWidth: number = parseInt(inputs2[0]);
const pictureHeight: number = parseInt(inputs2[1]);
const pictureRows: string[] = [];
for (let i = 0; i < pictureHeight; i++) {
    const pictureRow: string = readline();
    pictureRows.push(pictureRow);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const wally: string = wallyRows.join('');

const wallyIndexes: number[] = wally
    .split('')
    .map((char, index) => char !== ' ' ? index : undefined)
    .filter(index => index !== undefined);
const wallyChars: string = wally.replaceAll(' ', '');

const pictureGrid: string[][] = pictureRows.map(pictureRow => pictureRow.split(''));

let result: string;
[...Array(pictureHeight - wallyHeight + 1).keys()].some(h => {
    return [...Array(pictureWidth - wallyWidth + 1).keys()].some(w => {
        const tempPictureChars: string[] = pictureGrid.slice(h, h + wallyHeight).flatMap(pictureRow => pictureRow.slice(w, w + wallyWidth));
        const pictureChars: string = wallyIndexes.map(index => tempPictureChars[index]).join('');
        if (wallyChars !== pictureChars) {
            return false;
        }

        return result = `${w} ${h}`;
    });
});

// console.log('x y');
console.log(result);
