/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const numberSnails: number = parseInt(readline());
const speedSnails: number[] = [];
for (let i = 0; i < numberSnails; i++) {
    const speedSnail: number = parseInt(readline());
    speedSnails.push(speedSnail);
}
const mapHeight: number = parseInt(readline());
const _mapWidth: number = parseInt(readline());
const rows: string[] = [];
for (let i = 0; i < mapHeight; i++) {
    const ROW: string = readline();
    rows.push(ROW);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Position = {
    y: number,
    x: number
};

type Snail = {
    num: number,
    speed: number,
    position: Position,
    goalTime: number
};

const snails: Snail[] = [];
const goalPositions: Position[] = [];

rows.forEach((row, rowIndex) => {
    row.split('').forEach((value, valueIndex) => {
        const position: Position = { y: rowIndex, x: valueIndex };

        if (value.match(/\d/)) {
            const v: number = parseInt(value);
            const snail: Snail = {
                num: v,
                speed: speedSnails[v - 1],
                position,
                goalTime: -1
            };

            snails.push(snail);
        } else if (value === '#') {
            goalPositions.push(position);
        }
    });
});

snails.forEach(snail => {
    if (snail.speed === 0) {
        return;
    }

    const distance: number = goalPositions
        .map(goal => Math.abs(goal.y - snail.position.y) + Math.abs(goal.x - snail.position.x))
        .reduce((min, d) => Math.min(min, d));

    snail.goalTime = distance / snail.speed;
});

const winner: Snail = snails
    .filter(snail => snail.goalTime >= 0)
    .reduce((winner, snail) => snail.goalTime < winner.goalTime ? snail : winner);

const result: string = winner.num.toString();

// console.log('winner is number');
console.log(result);

