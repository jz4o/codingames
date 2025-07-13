/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const lines: string[] = [];
for (let i = 0; i < 3; i++) {
    const line: string = readline();
    lines.push(line);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class SmallestMovesCountCalculator {
    static calc: (grid: string[][]) => number = (grid: string[][]): number => {
        const [, centerRow]: string[][] = grid;
        const [, centerValue]: string[] = centerRow;
        if (centerValue !== '5') {
            return -1;
        }

        const clockwiseValues: string[] = this.#getClockwiseValuesFromRightBottom(grid);
        const emptyIndex: number = clockwiseValues.indexOf('.');
        clockwiseValues.splice(emptyIndex, 1);

        const orderedGrid: string[][] = [
            ['1', '2', '3'],
            ['4', '5', '6'],
            ['7', '8', '.'],
        ];
        const clockwiseOrderedValues: string[] = this.#getClockwiseValuesFromRightBottom(orderedGrid);
        const doubleClockwiseOrderedValues: string = clockwiseOrderedValues.join('').replace('.', '').repeat(2);

        if (!doubleClockwiseOrderedValues.includes(clockwiseValues.join(''))) {
            return -1;
        }

        const [, secondNumberClockwiseOrderedValue]: string[] = clockwiseOrderedValues;
        const secondNumberIndex: number = clockwiseValues.indexOf(secondNumberClockwiseOrderedValue);

        return Math.min(
            Math.abs((secondNumberIndex * (clockwiseValues.length + 1)) - emptyIndex),
             ((clockwiseValues.length - secondNumberIndex) * (clockwiseValues.length + 1)) + emptyIndex,
        );
    };

    static #getClockwiseValuesFromRightBottom: (grid: string[][]) => string[] = (grid: string[][]): string[] => {
        return [
            grid[2][2],
            grid[1][0],
            grid[0][2],
            grid[2][1],
            grid[0][0],
            grid[1][2],
            grid[2][0],
            grid[0][1],
        ];
    };
}

const grid: string[][] = lines.map(line => line.split(''));

const result: string = SmallestMovesCountCalculator.calc(grid).toString();

// console.log('-1');
console.log(result);

