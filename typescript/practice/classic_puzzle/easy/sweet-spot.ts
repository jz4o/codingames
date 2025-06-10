/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const lines: string[] = [];
for (let i = 0; i < N; i++) {
    const line: string = readline();
    lines.push(line);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Mass = {
    y: number,
    x: number,
    value: string,
    explosion: boolean
};

const rangeArrayFromTo: (from: number, to: number) => number[] = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
};

const explosionABomb: (grid: Mass[][], bombMass: Mass) => void = (grid: Mass[][], bombMass: Mass): void => {
    rangeArrayFromTo(bombMass.y - 3, bombMass.y + 3).forEach(y => {
        rangeArrayFromTo(bombMass.x - 3, bombMass.x + 3).forEach(x => {
            const diffY: number = Math.abs(bombMass.y - y);
            const diffX: number = Math.abs(bombMass.x - x);
            const maxDiff: number = Math.max(diffY, diffX);

            const value: number = 4 - maxDiff;

            if (!/[A-Z]/.test(grid[y][x].value)) {
                grid[y][x].value = Math.max(parseInt(grid[y][x].value), value).toString();
            }
            grid[y][x].explosion = true;
        });
    });
};

const explosionHBomb: (grid: Mass[][], bombMass: Mass) => void = (grid: Mass[][], bombMass: Mass): void => {
    const value: number = 5;

    rangeArrayFromTo(bombMass.y - 3, bombMass.y + 3).forEach(y => {
        rangeArrayFromTo(bombMass.x - 3, bombMass.x + 3).forEach(x => {
            if (!/[A-Z]/.test(grid[y][x].value)) {
                grid[y][x].value = Math.max(parseInt(grid[y][x].value), value).toString();
            }
            grid[y][x].explosion = true;
        });
    });
};

const explosionBBomb: (grid: Mass[][], bombMass: Mass) => void = (grid: Mass[][], bombMass: Mass): void => {
    rangeArrayFromTo(1, 3).forEach(n => {
        const explosionMasses: Mass[] = [
            grid[bombMass.y - n][bombMass.x],
            grid[bombMass.y + n][bombMass.x],
            grid[bombMass.y][bombMass.x - n],
            grid[bombMass.y][bombMass.x + n],
        ];

        const value: number = 4 - n;

        explosionMasses.forEach(explosionMass => {
            if (!/[A-Z]/.test(explosionMass.value)) {
                explosionMass.value = Math.max(parseInt(explosionMass.value), value).toString();
            }
            explosionMass.explosion = true;
        });
    });
};

[...Array(3).keys()].forEach(() => {
    lines.unshift('0'.repeat(N));
    lines.push('0'.repeat(N));
});

const grid: Mass[][] = lines
    .map(line => `${'0'.repeat(3)}${line}${'0'.repeat(3)}`.split(''))
    .map((row, rowIndex) => {
        return row.map((value, columnIndex) => {
            return { y: rowIndex, x: columnIndex, value, explosion: false };
        });
    });

const flatMasses: Mass[] = grid.flat();

flatMasses.filter(bombMass => bombMass.value === 'A').forEach(bombMass => explosionABomb(grid, bombMass));
flatMasses.filter(bombMass => bombMass.value === 'H').forEach(bombMass => explosionHBomb(grid, bombMass));

const explosionBBombMasses: Mass[] = flatMasses.filter(bombMass => bombMass.value === 'B' && bombMass.explosion);
const unexplosionBBombMasses: Mass[] = flatMasses.filter(bombMass => bombMass.value === 'B' && !bombMass.explosion);

explosionBBombMasses.forEach(bombMass => explosionBBomb(grid, bombMass));

let isExplosion: boolean;
do {
    const newExplosionBBombMasses: Mass[] = unexplosionBBombMasses.filter(bombMass => bombMass.explosion);
    newExplosionBBombMasses.forEach(bombMass => {
        explosionBBomb(grid, bombMass);

        const index: number = unexplosionBBombMasses.indexOf(bombMass);
        unexplosionBBombMasses.splice(index, 1);
    });

    isExplosion = newExplosionBBombMasses.length > 0;
} while (isExplosion);

const results: string[] = grid.slice(3, -3).map(row => {
    return row.slice(3, -3).map(mass => mass.value).join('');
});

// console.log('answer');
results.forEach(result => {
    console.log(result);
});

