/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs1: string[] = readline().split(' ');
const w: number = parseInt(inputs1[0]);
const h: number = parseInt(inputs1[1]);
const inputs2: string[] = readline().split(' ');
const startRow: number = parseInt(inputs2[0]);
const startCol: number = parseInt(inputs2[1]);
const n: number = parseInt(readline());
const mapRows: string[] = [];
for (let i = 0; i < n; i++) {
    for (let j = 0; j < h; j++) {
        const mapRow: string = readline();
        mapRows.push(mapRow);
    }
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type GloryMap = {
    index: number,
    pathCount: number
};

const EMPTY: string = '.';
const TREASURE: string = 'T';

const maps: string[][][] = [...Array(n).keys()].map(i => {
    const map: string[][] = mapRows.slice(i * h, (i + 1) * h).map(row => {
        return [EMPTY, ...row.split(''), EMPTY];
    })
    map.unshift(Array(w + 2).fill(EMPTY));
    map.push(Array(w + 2).fill(EMPTY));

    return map;
});

const gloryMaps: GloryMap[] = maps.map((map, index) => {
    let currentRow: number = startRow + 1;
    let currentCol: number = startCol + 1;
    let current: string;
    let pathCount: number = 0;

    do {
        current = map[currentRow][currentCol];
        map[currentRow][currentCol] = EMPTY; // measures for loop

        pathCount++;

        if (current === '^') {
            currentRow--;
        } else if (current === 'v') {
            currentRow++;
        } else if (current === '<') {
            currentCol--;
        } else if (current === '>') {
            currentCol++;
        }
    } while ('^v<>'.includes(current));

    if (current !== TREASURE) {
        return null;
    }

    return { index, pathCount };
}).filter(map => map);

gloryMaps.sort((a, b) => a.pathCount - b.pathCount);

const result: string = gloryMaps[0]?.index.toString() || 'TRAP';

// console.log('mapIndex');
console.log(result);
