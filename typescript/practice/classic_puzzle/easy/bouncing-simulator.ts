/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const w: number = parseInt(readline());
const h: number = parseInt(readline());
const n: number = parseInt(readline());

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const grid: string[][] = [...Array(h).keys()].map(() => {
    return ['#', ...Array(w).fill('0'), '#'];
});
grid.unshift(Array(w + 2).fill('#'));
grid.push(Array(w + 2).fill('#'));

let positionY: number = 1;
let positionX: number = 1;
grid[positionY][positionX] = '1';

let moveY: number = 1;
let moveX: number = 1;
let hitCount: number = 0;
while (hitCount < n) {
    const nextY: number = positionY + moveY;
    const nextX: number = positionX + moveX;

    const isOverflowY: boolean = nextY < 1 || h < nextY;
    const isOverflowX: boolean = nextX < 1 || w < nextX;
    if (isOverflowY || isOverflowX) {
        hitCount++;

        if (isOverflowY) {
            moveY *= -1;

            if (h === 1) {
                positionY = nextY;
            }
        }

        if (isOverflowX) {
            moveX *= -1;

            if (w === 1) {
                positionX = nextX;
            }
        }

        continue;
    }

    positionY = nextY;
    positionX = nextX;

    grid[positionY][positionX] = (parseInt(grid[positionY][positionX]) + 1).toString();
}

const results: string[] = grid.map(row => {
    return row.join('').replace(/0/g, ' ');
});

// console.log('Grid after n hits');
results.forEach(result => {
    console.log(result);
});
