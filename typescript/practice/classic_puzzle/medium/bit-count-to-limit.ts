/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const binaryLength: number = n.toString(2).length;

const kindOfNumber: number = n + 1;

const result: string = [...Array(binaryLength).keys()]
    .reduce((count, i) => {
        const halfCycleLength: number = 2 ** i;
        const cycleLength: number = halfCycleLength * 2;

        const div: number = Math.floor(kindOfNumber / cycleLength);
        const mod: number = kindOfNumber % cycleLength;

        return count + (div * halfCycleLength) + Math.max(mod - halfCycleLength, 0);
    }, 0)
    .toString();

// console.log('Number of 1s');
console.log(result);

