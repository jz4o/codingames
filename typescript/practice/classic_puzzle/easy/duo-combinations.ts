/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const total: number = parseInt(readline());
const symbols: string[] = [];
for (let i = 0; i < total; i++) {
    const symbol: string = readline();
    symbols.push(symbol);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo: (from: number, to: number) => number[] = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
};

const eachCons: <T>(targetArray: T[], n: number) => T[][] = <T>(targetArray: T[], n: number): T[][] => {
    return [...Array(targetArray.length - n + 1).keys()].map(i => {
        return targetArray.slice(i, i + n);
    });
};

const binaryCycle: string[] = rangeArrayFromTo(1, Math.pow(2, total) - 1).map(i => {
    return i.toString(2).padStart(total, '0');
});

const results: string[] = eachCons(symbols, 2).flatMap(([zero, one]) => {
    return binaryCycle.map(binary => binary.replace(/0/g, zero).replace(/1/g, one));
});
results.unshift(symbols[0].repeat(total));

// console.log('combination(s)');
results.forEach(result => {
    console.log(result);
});
