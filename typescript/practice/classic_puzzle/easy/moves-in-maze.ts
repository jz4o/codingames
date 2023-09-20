/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const w: number = parseInt(inputs[0]);
const h: number = parseInt(inputs[1]);
const rows: string[] = [];
for (let i = 0; i < h; i++) {
    const ROW: string = readline();
    rows.push(ROW);
}
// for (let i = 0; i < h; i++) {
//
//     // Write an answer using console.log()
//     // To debug: console.error('Debug messages...');
//
//     // console.log('answer');
// }

type Position = {
    y: number,
    x: number
};

const REPLACEABLE_CHARS: [string, string] = ['S', '.'];
const BASE_NUM: number = 36;

const grid: string[][] = rows.map(row => row.split(''));

const startRowIndex: number = grid.findIndex(row => row.includes('S'));
const startColumnIndex: number = grid[startRowIndex].indexOf('S');
const startPosition: Position = { y: startRowIndex, x: startColumnIndex };

let arivePositions: Position[] = [startPosition];

let step: number = 0;
while (arivePositions.length > 0) {
    const strStep: string = step.toString(BASE_NUM).toUpperCase();

    arivePositions = arivePositions.flatMap(position => {
        if (!REPLACEABLE_CHARS.includes(grid[position.y][position.x])) {
            return [];
        }

        grid[position.y][position.x] = strStep;

        const aroundPositions: [Position, Position, Position, Position] = [
            { y: (position.y === 0 ? h - 1 : position.y - 1), x: position.x },
            { y: position.y, x: (position.x === 0 ? w - 1 : position.x - 1) },
            { y: position.y, x: ((position.x + 1) % w) },
            { y: ((position.y + 1) % h), x: position.x }
        ];

        return aroundPositions.filter(aroundPosition => grid[aroundPosition.y][aroundPosition.x] === '.');
    });

    step++;
}

const results: string[] = grid.map(row => row.join(''));

results.forEach(result => {
    console.log(result);
});
