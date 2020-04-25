/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const BASE_NUM: number = 3;

const reverseResult: number[] = [];
Math.abs(N).toString(BASE_NUM).split('').reverse().forEach((n, index) => {
    reverseResult[index] = (reverseResult[index] || 0) + parseInt(n);

    // carry up
    if (BASE_NUM - 1 <= reverseResult[index]) {
        reverseResult[index] -= BASE_NUM;
        reverseResult[index + 1] = 1;
    }
});

const result: string = reverseResult.reverse()
                                    .map(i => N < 0 ? -i : i)
                                    .map(i => i < 0 ? 'T' : i)
                                    .join('');

// console.log('42');
console.log(result);
