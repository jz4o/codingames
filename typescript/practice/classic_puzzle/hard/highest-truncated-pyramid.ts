/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());

let partCount: number = 1;
let topStepCount: number = 1;
let bottomStepCount: number = 1;

while (partCount !== N) {
    if (partCount < N) {
        bottomStepCount++;
        partCount += bottomStepCount;
    } else if (N < partCount) {
        partCount -= topStepCount;
        topStepCount++;
    }
}

for (let i = topStepCount; i <= bottomStepCount; i++) {
    console.log('*'.repeat(i));
}

