/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo = (from: number, to: number, step: number = 1): number[] => {
    return [...Array((to - from + step) / step).keys()].map(i => (i * step) + from);
};

const isPrime = (digit: number): boolean => {
    if (digit < 2) {
        return false;
    }

    for (let i = 2; i < digit; i++) {
        if (digit % i === 0) {
            return false;
        }
    }

    return true;
};

const topRows: number[][] = [];
const bottomRows: number[][] = [];
rangeArrayFromTo(1, N, 2).forEach(i => {
    const topRowRightValue: number = (i ** 2) + i + 2;
    const topRowLeftValue: number = topRowRightValue + i - 1;
    const topRow: number[] = rangeArrayFromTo(topRowRightValue, topRowLeftValue).reverse();

    const bottomRowRightValue: number = i ** 2;
    const bottomRowLeftValue: number = bottomRowRightValue - i + 1;
    const bottomRow: number[] = rangeArrayFromTo(bottomRowLeftValue, bottomRowRightValue);

    rangeArrayFromTo(1, (N - i) / 2).forEach(j => {
        const innerSquareLastValue: number = (i + (j - 1) * 2) ** 2;
        const outerSquareLastValue: number = (i + (j * 2)) ** 2;

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

const numberGrid: number[][] = topRows.concat(bottomRows);
const results: string[] = numberGrid.map(numberRow => {
    return numberRow.map(num => isPrime(num) ? '#' : ' ').join(' ');
});

// console.log('ROW');
results.forEach(result => {
    console.log(result);
});

