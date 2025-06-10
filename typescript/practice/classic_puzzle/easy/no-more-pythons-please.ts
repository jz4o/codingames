/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const N: number = parseInt(inputs[0]);
const _M: number = parseInt(inputs[1]);
const ts: string[] = [];
for (let i = 0; i < N; i++) {
    const T: string = readline();
    ts.push(T);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Position = {
    y: number,
    x: number,
    v: string
};

type Snake = {
    partsSize: number
};

const HEAD_VALUE: string = 'o';
const HORIZONTAL_BODY_VALUE: string = '-';
const VERTICAL_BODY_VALUE: string = '|';
const CURVE_BODY_VALUE: string = '*';
const TAIL_VALUES: string[] = ['v', '<', '>', '^'];
const SEARCH_DIRECTIONS: string[] = ['top', 'right', 'left', 'bottom'];

const grid: string[][] = ts.map(t => t.split(''));

const tailPositions: Position[] = grid.flatMap((row, rowIndex) => {
    return row.map((value, valueIndex) => {
        if (!TAIL_VALUES.includes(value)) {
            return null;
        }

        return { y: rowIndex, x: valueIndex, v: value };
    });
}).filter(position => position);

const snakes: Snake[] = tailPositions.map(tailPosition => {
    const directionIndex: number = TAIL_VALUES.indexOf(tailPosition.v);
    let searchDirection: string = SEARCH_DIRECTIONS[directionIndex];

    let targetY: number = tailPosition.y;
    let targetX: number = tailPosition.x;
    let targetV: string = tailPosition.v;

    let partsSize: number = 1;
    while (targetV !== HEAD_VALUE) {
        if (searchDirection === 'top') {
            targetY--;
        } else if (searchDirection === 'right') {
            targetX++;
        } else if (searchDirection === 'left') {
            targetX--;
        } else if (searchDirection === 'bottom') {
            targetY++;
        } else {
            [targetY, targetX] = [0, 0];
        }

        targetV = grid[targetY][targetX];

        partsSize++;

        if (targetV !== CURVE_BODY_VALUE) {
            continue;
        }

        if (['top', 'bottom'].includes(searchDirection)) {
            const leftX: number = Math.max(targetX - 1, 0);
            searchDirection = grid[targetY][leftX] === HORIZONTAL_BODY_VALUE ? 'left' : 'right';
        } else if (['right', 'left'].includes(searchDirection)) {
            const topY: number = Math.max(targetY - 1, 0);
            searchDirection = grid[topY][targetX] === VERTICAL_BODY_VALUE ? 'top' : 'bottom';
        }
    }

    return { partsSize };
});

const maxSize: number = Math.max(...snakes.map(snake => snake.partsSize));
const maxSizeCount: number = snakes.filter(snake => snake.partsSize === maxSize).length;

const results: [number, number] = [maxSize, maxSizeCount];

// console.log('Answer');
results.forEach(result => {
    console.log(result);
});

