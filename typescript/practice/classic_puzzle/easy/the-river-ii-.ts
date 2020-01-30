/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const r1: number = parseInt(readline());

// Write an action using console.log()
// To debug: console.error('Debug messages...');

let isSuccess: boolean = false;
for (let i = r1 - 1; i >= 1; i--) {
    const iSum = i.toString().split('')
                             .map(d => parseInt(d))
                             .reduce((sum, d) => sum + d, 0);

    if (i + iSum === r1) {
        isSuccess = true;
        break;
    }
}

// console.log('YES|NO');
console.log(isSuccess ? 'YES' : 'NO');
