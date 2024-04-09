/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const m: number = parseInt(readline());
const n: number = parseInt(readline());

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Probability {
    static ROULETTE_PATTERN: number = 38;

    static probabilityCache: { [key: string]: number } = {};

    static calc: (m: number, n: number) => number = (m: number, n: number): number => {
        if (m === 1 && n === 1) {
            return 1;
        }

        if (m === 0) {
            return 0;
        }

        if (n < m) {
            return 0;
        }

        const cacheKey: string = `${m},${n}`;
        if (cacheKey in this.probabilityCache) {
            return this.probabilityCache[cacheKey];
        }

        const newNumberPatternPercent: number = this.calc(m - 1, n - 1) * ((this.ROULETTE_PATTERN - (m -  1)) / this.ROULETTE_PATTERN);
        const existNumberPatternPercent: number = this.calc(m, n - 1) * (m / this.ROULETTE_PATTERN);

        const result: number = newNumberPatternPercent + existNumberPatternPercent;

        this.probabilityCache[cacheKey] = result;

        return result;
    };
}

const rangeArrayFromTo: (from: number, to: number) => number[] = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
};

const floatResult: number = rangeArrayFromTo(m, n).reduce((sum, i) => sum + Probability.calc(i, n), 0);
const result: string = `${Math.round(floatResult * 100)}%`;

// console.log('probability');
console.log(result);
