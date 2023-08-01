/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const height: number = parseInt(readline());
const width: number = parseInt(readline());
const numberOfShelves: number = parseInt(readline());

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const topLeftParts: string = '/'.repeat(width / 2);
const topCenterParts: string = '^'.repeat(width % 2);
const topRightParts: string = '\\'.repeat(width / 2);
const top: string = [topLeftParts, topCenterParts, topRightParts].join('');

const shelfSpaceParts: string = `|${' '.repeat(width - 2)}|`;
const shelfBottomParts: string = `|${'_'.repeat(width - 2)}|`;
const shelfSpacePartsCount: number = Math.floor((height - 1) / numberOfShelves) - 1;
const normalShelf: string[] = [...Array(shelfSpacePartsCount)].map(() => shelfSpaceParts).concat([shelfBottomParts]);

const expandShelf: string[] = [shelfSpaceParts, ...normalShelf];

const expandShelfCount: number = (height - 1) % numberOfShelves;
const normalShelfCount: number = numberOfShelves - expandShelfCount;

const normalShelves: string[] = [...Array(normalShelfCount)].flatMap(() => normalShelf);
const expandShelves: string[] = [...Array(expandShelfCount)].flatMap(() => expandShelf);

const results: string[] = [top, ...normalShelves, ...expandShelves];

// console.log('the Bookcase');
results.forEach(result => {
    console.log(result);
});
