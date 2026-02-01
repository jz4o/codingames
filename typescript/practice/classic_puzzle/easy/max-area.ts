/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const inputs: string[] = readline().split(' ');
const as: number[] = [];
for (let i = 0; i < n; i++) {
    const a: number = parseInt(inputs[i]);
    as.push(a);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const areas: number[] = as.flatMap((l, lIndex) => {
    if (l <= Math.max(...as.slice(0, lIndex))) {
        return [];
    }

    return as.slice(lIndex + 1).map((r, index) => {
        const rIndex = lIndex + 1 + index;

        const height: number = Math.min(l, r);
        const width: number = rIndex - lIndex;

        return height * width;
    });
});

const result: string = Math.max(...areas).toString();

// console.log('answer');
console.log(result);
