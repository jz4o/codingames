/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const lines: string[] = [];
for (let i = 0; i < n; i++) {
    const line: string = readline();
    lines.push(line);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Enemy = {
    rowIndex: number,
    columnIndex: number,
    _value: string
};

const ENEMY_VALUES: string[] = ['>', '<'];
const enemies: Enemy[] = lines.flatMap((row, rowIndex) => {
    return row.split('').map((value, columnIndex) => {
        if (!ENEMY_VALUES.includes(value)) {
            return null;
        }

        return { rowIndex, columnIndex, _value: value };
    }).filter(enemy => enemy !== null);
});

const LAUNCHER_VALUE: string = '^';
const launcherRowIndex: number = lines.findIndex(row => row.includes(LAUNCHER_VALUE));
const launcherColumnIndex: number = lines[launcherRowIndex].indexOf(LAUNCHER_VALUE);

const shootIndexes: number[] = enemies.map(enemy => {
    const verticalDiff: number = launcherRowIndex - enemy.rowIndex;
    const horizontalDiff: number = Math.abs(launcherColumnIndex - enemy.columnIndex);

    return Math.abs(verticalDiff - horizontalDiff) - 1;
});

const maxShootIndex: number = shootIndexes.reduce((max, shootIndex) => Math.max(max, shootIndex));
const results: string[] = [...Array(maxShootIndex + 1).keys()].map(index => {
    return shootIndexes.includes(index) ? 'SHOOT' : 'WAIT';
});

// console.log('WAIT');
// console.log('SHOOT');
results.forEach(result => {
    console.log(result);
});
