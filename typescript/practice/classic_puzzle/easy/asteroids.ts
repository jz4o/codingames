/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const W: number = parseInt(inputs[0]);
const H: number = parseInt(inputs[1]);
const T1: number = parseInt(inputs[2]);
const T2: number = parseInt(inputs[3]);
const T3: number = parseInt(inputs[4]);
const inputRows: [string, string][] = [];
for (let i = 0; i < H; i++) {
    const inputs: string[] = readline().split(' ');
    const firstPictureRow: string = inputs[0];
    const secondPictureRow: string = inputs[1];
    inputRows.push([firstPictureRow, secondPictureRow]);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

interface Position {
    y: number;
    x: number;
};

interface PicturePosition {
    first?: Position;
    second?: Position;
    third?: Position;
};

const firstPictureRows: string[] = [];
const secondPictureRows: string[] = [];
inputRows.forEach(inputRow => {
    const [firstPictureRow, secondPictureRow]: [string, string] = inputRow;

    firstPictureRows.push(firstPictureRow);
    secondPictureRows.push(secondPictureRow);
});

const marks: string[] = firstPictureRows.join('').replace(/\./g, '').split('').sort().reverse();

const positionObject: { [key: string]: PicturePosition } = {};
marks.forEach(mark => {
    positionObject[mark] = {};
});

firstPictureRows.forEach((row, rowIndex) => {
    row.split('').forEach((char, charIndex) => {
        if (!(char in positionObject)) {
            return;
        }

        positionObject[char].first = { y: rowIndex, x: charIndex };
    });
});

secondPictureRows.forEach((row, rowIndex) => {
    row.split('').forEach((char, charIndex) => {
        if (!(char in positionObject)) {
            return;
        }

        positionObject[char].second = { y: rowIndex, x: charIndex };
    });
});

marks.forEach(mark => {
    const markObject: PicturePosition = positionObject[mark];
    const ySpeed: number = (markObject.second.y - markObject.first.y) / (T2 - T1);
    const xSpeed: number = (markObject.second.x - markObject.first.x) / (T2 - T1);

    const thirdY: number = markObject.second.y + Math.floor(ySpeed * (T3 - T2));
    const thirdX: number = markObject.second.x + Math.floor(xSpeed * (T3 - T2));

    if (thirdY < 0 || H <= thirdY) {
        return;
    }

    if (thirdX < 0 || W <= thirdX) {
        return;
    }

    markObject.third = { y: thirdY, x: thirdX };
});

const thirdPictureGrid: string[][] = [...Array(H).keys()].map(() => {
    return [...Array(W).keys()].map(() => '.');
});
marks.forEach(mark => {
    const thirdPosition: Position = positionObject[mark].third;
    if (thirdPosition === undefined) {
        return;
    }

    const thirdY: number = thirdPosition.y;
    const thirdX: number = thirdPosition.x;

    thirdPictureGrid[thirdY][thirdX] = mark;
});

const results: string[] = thirdPictureGrid.map(row => row.join(''));

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
