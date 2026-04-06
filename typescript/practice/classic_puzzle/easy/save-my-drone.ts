/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const _X: number = parseInt(readline());
const Y: number = parseInt(readline());
const R: number = parseInt(readline());
const rows: string[] = [];
for (let i = 0; i < Y; i++) {
    const ROW: string = readline();
    rows.push(ROW);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const tileNames: { [key: string]: string } = {
    '#': 'Block',
    '^': 'Thruster',
    '@': 'Gyroscope',
    '+': 'Fuel',
    '$': 'Core',
};

let tilesStr = rows.join('').split('').filter(char => char in tileNames).join('');
if (R === 1) {
    tilesStr = tilesStr.split('').reverse().join('');
}

const splitedPerTiles: string[] = tilesStr.match(/#+|\^+|@+|\++|\$+/g) || [];
const dataArray: string[] = splitedPerTiles.map(tiles => {
    return `${tiles.length} ${tileNames[tiles[0]]}${tiles.length > 1 ? 's' : ''}`;
});

const result: string = dataArray.length > 0 ? dataArray.join(', ') : 'Nothing';

// console.log('answer');
console.log(result);
