/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 * NOTE:
 * In the default code, a single prize is read before the
 * rest are read in a loop due to a current limitation in
 * stub generation. The number of prizes is (1 + height)
 **/

const height: number = parseInt(readline());
const incrementsRows: string[] = [];
for (let i = 0; i < height; i++) {
    const increments: string = readline();
    incrementsRows.push(increments);
}
const prizes: number[] = [];
const prize1: number = parseInt(readline());
prizes.push(prize1);
for (let i = 0; i < height; i++) {
    const prize: number = parseInt(readline());
    prizes.push(prize);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const zip: <T, U>(a: T[], b: U[]) => [T, U][] = <T, U>(a: T[], b: U[]): [T, U][] => {
    const arraySize: number = Math.max(a.length, b.length);
    return [...Array(arraySize).keys()].map(index => {
        return [a[index], b[index]];
    });
};

const incrementGrid: number[][] = incrementsRows.map(incrementsRow => {
    return incrementsRow.split('').map(increment => parseInt(increment));
});

const counterGrid: number[][] = incrementGrid.reduce((counterGrid, incrementRow) => {
    const counterRow: number[] = incrementRow.map((increment, incrementColumn) => {
        const lastCounterRow: number[] = counterGrid.at(-1) || [];
        const topLeftIncrement: number = lastCounterRow[Math.max(incrementColumn - 1, 0)] || 0;
        const topRightIncrement: number = lastCounterRow[incrementColumn] || 0;

        return Math.max(topLeftIncrement, topRightIncrement) + increment;
    });

    return [...counterGrid, counterRow];
}, [] as number[][]);

const lastCounterRow: number[] = counterGrid[counterGrid.length - 1];
const totalCounters: number[] = zip([0, ...lastCounterRow], [...lastCounterRow, 0]).map(([l, r]) => Math.max(l, r));

const possibleWins: number[] = zip(totalCounters, prizes).map(([totalCount, prize]) => totalCount * prize);

const result: string = Math.max(...possibleWins).toString();

// console.log('jackpot');
console.log(result);
