/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
}

const INITIAL_ARRAY: number[] = rangeArrayFromTo(1, N);
const CENTER_INDEX: number = Math.trunc(N / 2);
let array: number[] = INITIAL_ARRAY;
const progressLog: string[] = [];

for (let i = 0; i < N; i++) {
    const frontHalf: number[] = array.slice(0, CENTER_INDEX);
    const backHalf: number[] = array.slice(CENTER_INDEX);

    array = [...backHalf.reverse()].reduce((result, value, index) => {
        result.push(value);
        if (index in frontHalf) {
            result.push(frontHalf[index]);
        }

        return result;
    }, []);

    progressLog.push(array.join(','));
}

// console.log('IMPOSSIBLE');
if (JSON.stringify(array) == JSON.stringify(INITIAL_ARRAY)) {
    console.log(progressLog.join("\n"));
} else {
    console.log('IMPOSSIBLE');
}
