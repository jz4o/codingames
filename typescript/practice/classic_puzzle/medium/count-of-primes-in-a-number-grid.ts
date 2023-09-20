/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const R: number = parseInt(inputs[0]);
const _C: number = parseInt(inputs[1]);
const grid: string[][] = [];
for (let i = 0; i < R; i++) {
    const row: string = readline();

    grid.push(row.split(' '));
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

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
}

const digits: number[] = [];
const transposeGrid: string[][] = grid[0].map((_value, index) => grid.map(row => row[index]));
[...grid, ...transposeGrid].forEach(row => {
    for (let start = 0; start < row.length; start++) {
        for (let end = start + 1; end <= row.length; end++) {
            const digit: number = parseInt(row.slice(start, end).join(''));

            if (!digits.includes(digit)) {
                digits.push(digit);
            }
        }
    }
});

// console.log('answer');
const result: number = digits.filter(digit => isPrime(digit)).length;
console.log(result);

