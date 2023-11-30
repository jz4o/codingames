/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline()); // the number of mountains
const inputs: string[] = readline().split(' ');
const heights: number[] = [];
for (let i = 0; i < n; i++) {
    const height: number = parseInt(inputs[i]);// height of the mountain
    heights.push(height);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const transpose: <T>(array: T[][]) => T[][] = <T>(array: T[][]): T[][] => {
    return array[0].map((_value, index) => array.map(row => row[index]));
};

const maxHeight: number = Math.max(...heights);

const transposedMap: string[][] = [];
heights.forEach(height => {
    [...Array(height).keys()].forEach(h => {
        const leftSpace: string = ' '.repeat(maxHeight - h - 1);
        const rightSpace: string = ' '.repeat(h);

        transposedMap.push(`${leftSpace}/${rightSpace}`.split(''));
    });

    [...Array(height).keys()].forEach(h => {
        const leftSpace: string = ' '.repeat(maxHeight - height + h);
        const rightSpace: string = ' '.repeat(height - h - 1);

        transposedMap.push(`${leftSpace}\\${rightSpace}`.split(''));
    });
});

const mountainMap: string[][] = transpose(transposedMap);

const results: string[] = mountainMap.map(mountainRow => mountainRow.join('').trimEnd());

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
