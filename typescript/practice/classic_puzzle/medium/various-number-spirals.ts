/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const inputs1: string[] = readline().split(' ');
const vertPos: string = inputs1[0];
const horPos: string = inputs1[1];
const inputs2: string[] = readline().split(' ');
const order: string = inputs2[0];
const direction: string = inputs2[1];

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const transpose: <T>(array: T[][]) => T[][] = <T>(array: T[][]): T[][] => {
    return array[0].map((_value, index) => array.map(row => row[index]));
};

class NumberSpiral {
    static create: (size: number, vertPos: string, horPos: string, order: string, direction: string) => number[][] = (size: number, vertPos: string, horPos: string, order: string, direction: string): number[][] => {
        let numberSpiral: number[][] = this.createFixedNumberSpiral(size);

        // starting point
        const counterClockCount: number = ['br', 'tr', 'tl', 'bl'].indexOf(`${vertPos}${horPos}`);
        [...Array(counterClockCount).keys()].forEach(() => {
            numberSpiral = this.counterClock(numberSpiral);
        });

        // direction
        if (direction === 'cc') {
            numberSpiral = this.reverseDirection(numberSpiral);
        }

        // order
        if (order === '+') {
            numberSpiral = this.reverseOrder(numberSpiral);
        }

        return numberSpiral;
    };

    // create spiral by below condition
    //
    // conditions:
    //
    //   size: #{size}
    //   vert_pos: b
    //   hor_pos: r
    //   order: -
    //   direction: c
    //
    // exapmles:
    //
    //   5 4 3
    //   6 1 2
    //   7 8 9
    //
    //   10  9  8  7
    //   11  2  1  6
    //   12  3  4  5
    //   13 14 15 16
    static createFixedNumberSpiral: (size: number) => number[][] = (size: number): number[][] => {
        const topRows: number[][] = [];
        const bottomRows: number[][] = [];

        rangeArrayFromTo(1, Math.floor(size / 2) * 2 + 2 - 1, 2).forEach(i => {
            const topRowRightValue: number = Math.pow(i, 2) + i + 2;
            const topRowLeftValue: number = topRowRightValue + i - 1;
            const topRow: number[] = rangeArrayFromTo(topRowRightValue, topRowLeftValue).reverse();

            const bottomRowRightValue: number = Math.pow(i, 2);
            const bottomRowLeftValue: number = bottomRowRightValue - i + 1;
            const bottomRow: number[] = rangeArrayFromTo(bottomRowLeftValue, bottomRowRightValue);

            rangeArrayFromTo(1, Math.floor(((Math.floor(size / 2) * 2 + 1) - i) / 2)).forEach(j => {
                const innerSquareLastValue: number = Math.pow(i + (j - 1) * 2, 2);
                const outerSquareLastValue: number = Math.pow(i + (j * 2), 2);

                const bottomRowLeftValue: number = outerSquareLastValue - i - j * 3 + 1;
                const bottomRowRightValue: number = innerSquareLastValue + j;

                const topRowLeftValue: number = bottomRowLeftValue - i;
                const topRowRightValue: number = bottomRowRightValue + i;

                topRow.push(topRowRightValue);
                topRow.unshift(topRowLeftValue);

                bottomRow.push(bottomRowRightValue);
                bottomRow.unshift(bottomRowLeftValue);
            });

            topRows.unshift(topRow);
            bottomRows.push(bottomRow);
        });

        // remove trash row
        topRows.shift();

        let numberSpiral: number[][] = [...topRows, ...bottomRows];

        if (size % 2 === 0) {
            numberSpiral.pop();
            numberSpiral = numberSpiral.map(row => row.slice(1));

            [...Array(2).keys()].forEach(() => {
                numberSpiral = this.counterClock(numberSpiral);
            });
        }

        return numberSpiral;
    };

    static counterClock: (numberSpiral: number[][]) => number[][] = (numberSpiral: number[][]): number[][] => {
        return transpose(numberSpiral).reverse();
    };

    static reverseOrder: (numberSpiral: number[][]) => number[][] = (numberSpiral: number[][]): number[][] => {
        const spiralSize: number = numberSpiral.length;

        const numbers: number[] = numberSpiral.flat();
        const sumNumber: number = Math.min(...numbers) + Math.max(...numbers);

        const diffNumbers: number[] = numbers.map(num => sumNumber - num);

        return [...Array(spiralSize).keys()].map(i => diffNumbers.slice(i * spiralSize, (i + 1) * spiralSize));
    };

    static reverseDirection: (numberSpiral: number[][]) => number[][] = (numberSpiral: number[][]): number[][] => {
        const numbers: number[] = numberSpiral.flat();
        const maxNumber: number = Math.max(...numbers);
        const isStartTlOrBr: boolean = [numbers[0], numbers[numbers.length - 1]].includes(maxNumber);

        if (isStartTlOrBr) {
            return transpose(numberSpiral);
        } else {
            return transpose([...numberSpiral].reverse()).reverse();
        }
    };
}

const numberSpiral: number[][] = NumberSpiral.create(n, vertPos, horPos, order, direction);

const results: string[] = numberSpiral.map(row => row.join('\t'));

// console.log('spiral');
results.forEach(result => {
    console.log(result);
});

