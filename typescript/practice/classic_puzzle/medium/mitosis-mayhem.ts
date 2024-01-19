/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs1: string[] = readline().split(' ');
const max: number = parseInt(inputs1[0]);
const cycles: number = parseInt(inputs1[1]);
const inputRows: [string, number, number][] = [];
for (let i = 0; i < cycles; i++) {
    const inputs2: string[] = readline().split(' ');
    const name: string = inputs2[0];
    const initialCount: number = parseInt(inputs2[1]);
    const power: number = parseInt(inputs2[2]);
    inputRows.push([name, initialCount, power]);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Cell = {
    name: string,
    territoryCount: number,
    power: number,
    index: number
};

const powerCellObject: { [key: number]: Cell[] } = {};
[...Array(cycles).keys()].some(cycleIndex => {
    const allCells: Cell[] = Object.values(powerCellObject).flat();

    let remain: number = max - allCells.reduce((sum, cell) => sum + cell.territoryCount, 0);
    const isConflictTerritory: boolean = remain === 0;

    if (isConflictTerritory) {
        const powerCells: Cell[] = powerCellObject[Math.max(...Object.keys(powerCellObject).map(k => parseInt(k)))];
        powerCells.forEach(powerCell => {
            const robberyCount: number = Math.floor(powerCell.territoryCount / 10);

            const sortedCells: Cell[] = [...allCells].sort((a, b) => {
                if (a.power !== b.power) {
                    return a.power - b.power;
                }

                return a.territoryCount - b.territoryCount;
            });

            const robberyCell: Cell = sortedCells.find(cell => {
                return cell.power < powerCell.power && robberyCount <= cell.territoryCount;
            });
            if (robberyCell === undefined) {
                return;
            }

            powerCell.territoryCount += robberyCount;
            robberyCell.territoryCount -= robberyCount;
        });
    } else {
        Object.keys(powerCellObject).sort().reverse().forEach(power => {
            const powerCells: Cell[] = powerCellObject[power];

            const sumCountPowerCells: number = powerCells.reduce((sum, cell) => sum + cell.territoryCount, 0);
            if (remain < sumCountPowerCells) {
                powerCells.forEach(powerCell => {
                    powerCell.territoryCount += Math.floor(remain / powerCells.length);
                })
                remain = 0;
            } else if (sumCountPowerCells <= remain) {
                powerCells.forEach(powerCell => {
                    remain -= powerCell.territoryCount;
                    powerCell.territoryCount *= 2;
                });
            }
        });
    }

    const [name, initialCount, power]: [string, number, number] = inputRows.shift();
    if (name === 'STOP!') {
        return true;
    }

    const cell: Cell = { name: name, territoryCount: initialCount, power: power, index: cycleIndex };
    if (!(cell.power in powerCellObject)) {
        powerCellObject[cell.power] = [];
    }
    powerCellObject[cell.power].push(cell);
});

const cells: Cell[] = Object.values(powerCellObject).flat().filter(cell => cell.territoryCount > 0).sort((a, b) => a.index - b.index);
const sumTerritoryCount: number = cells.reduce((sum, cell) => sum + cell.territoryCount, 0);

const results: string[] = [];

if (max < sumTerritoryCount) {
    results.push('OVERFLOW!');
}
if (sumTerritoryCount < max) {
    results.push(`EMPTY: ${max - sumTerritoryCount}`);
}
if (sumTerritoryCount <= max) {
    results.push(...cells.map(cell => `${cell.name}: ${cell.territoryCount}`));
}

// console.log('The Answer: 42');
results.forEach(result => {
    console.log(result);
});
