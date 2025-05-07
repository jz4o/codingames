/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs1: string[] = readline().split(' ');
const n: number = parseInt(inputs1[0]);
const a: number = parseInt(inputs1[1]);
const b: number = parseInt(inputs1[2]);
const k: number = parseInt(readline());
const inputs2: string[] = readline().split(' ');
const nums: number[] = [];
for (let i = 0; i < k; i++) {
    const num: number = parseInt(inputs2[i]);
    nums.push(num);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');


const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const results: string[] = rangeArrayFromTo(a, b).map(i => {
    let isBuzzle: boolean = false;

    // level 1
    // isBuzzle ||= i.toString().endsWith('7');
    // isBuzzle ||= i % 7 === 0;


    // level 2
    // let previousTempI: number = i;
    // let tempI: number = i;
    // do {
    //     isBuzzle ||= tempI.toString().endsWith('7');
    //     isBuzzle ||= tempI % 7 === 0;
    //
    //     previousTempI = tempI;
    //     tempI = tempI.toString().split('').reduce((sum, c) => sum + parseInt(c), 0);
    // } while (previousTempI !== tempI && !isBuzzle);


    // level 3
    // let previousTempI: number = i;
    // let tempI: number = i;
    // do {
    //     nums.some(num => {
    //         isBuzzle ||= tempI.toString().endsWith(num.toString());
    //         isBuzzle ||= tempI % num === 0;
    //
    //         return isBuzzle
    //     });
    //
    //     previousTempI = tempI;
    //     tempI = tempI.toString().split('').reduce((sum, c) => sum + parseInt(c), 0);
    // } while (previousTempI !== tempI && !isBuzzle);


    // level 4
    let previousTempI: number = i;
    let tempI: number = i;
    do {
        nums.some(num => {
            isBuzzle ||= tempI.toString(n).endsWith(num.toString(n));
            isBuzzle ||= tempI % num === 0;

            return isBuzzle;
        });

        previousTempI = tempI;
        tempI = tempI.toString(n).split('').reduce((sum, c) => sum + parseInt(c, n), 0);
    } while (previousTempI !== tempI && !isBuzzle);

    return isBuzzle ? 'Buzzle' : i.toString();
});

// console.log('Buzzle');
results.forEach(result => {
    console.log(result);
});
