/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const TRY_POINT:       number = 5;
const TRANSFORM_POINT: number = 2;
const PENA_DROP_POINT: number = 3;

let results: string[] = [];

const possibleTryTimes: number = Math.floor(N / TRY_POINT);
for (let tryTimes = possibleTryTimes; tryTimes >= 0; tryTimes--) {
    const tryPoints: number = TRY_POINT * tryTimes;

    const possibleTransformationTimes: number = Math.min(Math.floor((N - tryPoints) / TRANSFORM_POINT), tryTimes);
    for (let transformationTimes = possibleTransformationTimes; transformationTimes >= 0; transformationTimes--) {
        const transformPoints: number = TRANSFORM_POINT * transformationTimes;

        const reminingPoints: number = N - tryPoints - transformPoints;
        if (reminingPoints % PENA_DROP_POINT === 0) {
            const penaltieOrDropTimes = reminingPoints / PENA_DROP_POINT;
            results.unshift(`${tryTimes} ${transformationTimes} ${penaltieOrDropTimes}`);
        }
    }
}

// console.log('tries transformations penalties');
for (const result of results) {
    console.log(result);
}
