/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const rows: string[] = [];
for (let i = 0; i < 23; i++) {
    const ROW: string = readline();
    rows.push(ROW);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const ROW_SIZE: number = 8;

const zip: <T, U>(a: T[], b: U[]) => [T, U][] = <T, U>(a: T[], b: U[]): [T, U][] => {
    const arraySize: number = Math.max(a.length, b.length);
    return [...Array(arraySize).keys()].map(index => {
        return [a[index], b[index]];
    });
};

const rangeArrayFromTo = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
};

const transpose = <T>(array: T[][]): T[][] => {
    const rowSize: number = array.length;
    const columnSize: number = array[0].length;

    const result: T[][] = [];
    rangeArrayFromTo(0, columnSize - 1).forEach(columnIndex => {
        const transposedRow: T[] = [];
        rangeArrayFromTo(0, rowSize - 1).forEach(rowIndex => {
            transposedRow.push(array[rowIndex][columnIndex]);
        });
        result.push(transposedRow);
    });

    return result;
};

class DigitalNumber {
    bitsArray: number[];

    constructor(scoreRows: string[]) {
        this.bitsArray = DigitalNumber.#toBitsArray(scoreRows);
    }

    subtractScore: (scoreRows: string[]) => void = (scoreRows: string[]): void => {
        this.bitsArray = zip(this.bitsArray, DigitalNumber.#toBitsArray(scoreRows)).map(([s1, s2]) => s1 & (s2 ^ 0b1111111));
    };

    addScore: (scoreRows: string[]) => void = (scoreRows: string[]): void => {
        this.bitsArray = zip(this.bitsArray, DigitalNumber.#toBitsArray(scoreRows)).map(([s1, s2]) => s1 | s2);
    };

    toString: () => string = (): string => {
        const DIGIT_BITS: string[] = [
            '1110111', '0000011', '0111110', '0011111', '1001011',
            '1011101', '1111101', '0010011', '1111111', '1011111'
        ];

        return [...this.bitsArray].reverse().map(s => DIGIT_BITS.indexOf(s.toString(2).padStart(7, '0'))).join('');
    };

    static #toBitsArray: (scoreRows: string[]) => number[] = (scoreRows: string[]): number[] => {
        const ROW_SIZE: number = 8;

        const scoreGrid: string[][] = transpose(scoreRows.map(row => row.split('')));
        const bitsArray: number[] = [...Array(Math.ceil(scoreGrid.length / 8)).keys()].map(i => {
            const digitRows: string[][] = scoreGrid.slice(i * ROW_SIZE, i * ROW_SIZE + ROW_SIZE);
            if (digitRows.length !== ROW_SIZE) {
                return null;
            }

            const bits: string = [
                digitRows[2][2] === '|' ? '1' : '0', // left top
                digitRows[2][4] === '|' ? '1' : '0', // left bottom
                digitRows[4][1] === '~' ? '1' : '0', // center top
                digitRows[4][3] === '~' ? '1' : '0', // center
                digitRows[4][5] === '~' ? '1' : '0', // center bottom
                digitRows[6][2] === '|' ? '1' : '0', // right top
                digitRows[6][4] === '|' ? '1' : '0'  // right bottom
            ].join('');

            return parseInt(bits, 2);
        }).filter(bits => bits !== null).reverse();

        return bitsArray;
    };
}

const [digitalRows1, digitalRows2, digitalRows3]: string[][] = [...Array(3).keys()].map(i => {
    return rows.slice(i * ROW_SIZE, (i + 1) * ROW_SIZE);
});

const digitalNumber: DigitalNumber = new DigitalNumber(digitalRows1);
digitalNumber.subtractScore(digitalRows2);
digitalNumber.addScore(digitalRows3);

const result: string = digitalNumber.toString();

// console.log('newScore');
console.log(result);

