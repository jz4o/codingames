/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const texts: string[] = [];
for (let i = 0; i < 6; i++) {
    const text: string = readline();
    texts.push(text);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Position = {
    y: number,
    x: number,
    value: string
};

const TREE: string = '#';
const CUT_DOWN_TREE: string = '=';
const EMPTY: string = 'o';
const FIRE: string = '*';

const grid: string[][] = texts.map(text => {
    return [EMPTY, EMPTY, ...text.split(''), EMPTY, EMPTY];
});
grid.unshift(Array(grid[0].length).fill(EMPTY));
grid.unshift(Array(grid[0].length).fill(EMPTY));
grid.push(Array(grid[0].length).fill(EMPTY));
grid.push(Array(grid[0].length).fill(EMPTY));

const positions: Position[] = grid.flatMap((row, rowIndex) => {
    return row.map((value, valueIndex) => {
        return { y: rowIndex, x: valueIndex, value };
    });
});

const beforeTreeSize: number = positions.filter(position => position.value === TREE).length;

const firePositions: Position[] = [...Array(positions.length).keys()]
    .reverse()
    .map(index => {
        if (positions[index].value !== FIRE) {
            return null;
        }

        return positions.splice(index, 1);
    })
    .flat()
    .filter(position => position);

firePositions.forEach(firePosition => {
    positions.forEach(position => {
        if (position.value !== TREE) {
            return;
        }
        if (position.y < firePosition.y - 2 || firePosition.y + 2 < position.y) {
            return;
        }
        if (position.x < firePosition.x - 2 || firePosition.x + 2 < position.x) {
            return;
        }

        position.value = CUT_DOWN_TREE;
    });
});

const afterTreeSize: number = positions.filter(position => position.value === TREE).length;

let result: string;
if (firePositions.length === 0) {
    result = 'RELAX';
} else if (afterTreeSize === 0) {
    result = 'JUST RUN';
} else {
    result = (beforeTreeSize - afterTreeSize).toString();
}

// console.log('12');
console.log(result);
