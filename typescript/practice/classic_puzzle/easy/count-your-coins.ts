/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const valueToReach: number = parseInt(readline());
const N: number = parseInt(readline());
const inputs1: string[] = readline().split(' ');
const counts: number[] = [];
for (let i = 0; i < N; i++) {
    const count: number = parseInt(inputs1[i]);
    counts.push(count);
}
const inputs2: string[] = readline().split(' ');
const values: number[] = [];
for (let i = 0; i < N; i++) {
    const value: number = parseInt(inputs2[i]);
    values.push(value);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const zip: <T, U>(a: T[], b: U[]) => [T, U][] = <T, U>(a: T[], b: U[]): [T, U][] => {
    const arraySize: number = Math.max(a.length, b.length);
    return [...Array(arraySize).keys()].map(index => {
        return [a[index], b[index]];
    });
};

const countValues: [number, number][] = zip(counts, values).sort(([_ac, av], [_bc, bv]) => av - bv);

const sumValue: number = countValues.reduce((sum, [c, v]) => sum + c * v, 0);

let resultNum: number;
if (sumValue < valueToReach) {
    resultNum = -1;
} else {
    let tempValueToReach: number = valueToReach;

    let sumCount: number = 0;
    countValues.some(([c, v]) => {
        const payCount: number = Math.min(Math.ceil(tempValueToReach / v), c);

        sumCount += payCount;
        tempValueToReach -= payCount * v;

        if (tempValueToReach <= 0) {
            return true;
        }
    });

    resultNum = sumCount;
}

const result: string = resultNum.toString();

// console.log('-1');
console.log(result);
