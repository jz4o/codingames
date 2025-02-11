/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const rows: string[] = [];
for (let i = 0; i < n; i++) {
    const row: string = readline();
    rows.push(row);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const ISLAND: string = '#';
const WATER: string = '~';
const EMPTY: string = '.';

interface Cell {
    y: number;
    x: number;
    v: string;
}

const tempRows: string[] = rows.map(row => `${EMPTY}${row}${EMPTY}`);
tempRows.unshift(EMPTY.repeat(n + 2));
tempRows.push(EMPTY.repeat(n + 2));

const grid: Cell[][] = tempRows.map((row, rowIndex) => {
    return row.split('').map((value, valueIndex) => ({y: rowIndex, x: valueIndex, v: value}));
});

const beCheckIslands: Cell[] = grid.flat().filter(cell => cell.v === ISLAND);
const islandGroups: Cell[][] = [];
while (beCheckIslands.length > 0) {
    const checkIsland: Cell = beCheckIslands.shift();

    const newIslandGroup: Cell[] = [];
    const beCheckGroupIslands: Cell[] = [checkIsland];
    while (beCheckGroupIslands.length > 0) {
        const checkGroupIsland: Cell = beCheckGroupIslands.pop();

        if (!newIslandGroup.includes(checkGroupIsland)) {
            newIslandGroup.push(checkGroupIsland);
        }
        if (beCheckIslands.includes(checkGroupIsland)) {
            const targetIndex: number = beCheckIslands.indexOf(checkGroupIsland);
            beCheckIslands.splice(targetIndex, 1);
        }

        const aroundIslands: Cell[] = [
            grid[checkGroupIsland.y - 1][checkGroupIsland.x],
            grid[checkGroupIsland.y][checkGroupIsland.x - 1],
            grid[checkGroupIsland.y][checkGroupIsland.x + 1],
            grid[checkGroupIsland.y + 1][checkGroupIsland.x],
        ].filter(cell => cell.v === ISLAND);

        aroundIslands.forEach(cell => {
            if (beCheckGroupIslands.includes(cell) || newIslandGroup.includes(cell)) {
                return;
            }

            beCheckGroupIslands.push(cell);
        });
    }

    islandGroups.push(newIslandGroup);
}

const coastLengths = islandGroups.map(islandGroup => {
    const waters: Cell[] = islandGroup.flatMap(island => {
        return [
            grid[island.y - 1][island.x],
            grid[island.y][island.x - 1],
            grid[island.y][island.x + 1],
            grid[island.y + 1][island.x],
        ].filter(cell => cell.v === WATER);
    });

    return new Set(waters).size;
});

const longestCoast: number = Math.max(...coastLengths);
const islandIndex: number = coastLengths.indexOf(longestCoast) + 1;

const result: string = `${islandIndex} ${longestCoast}`;

// console.log('answer');
console.log(result);
