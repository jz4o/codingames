/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const fs: number[] = [];
for (let i = 0; i < N; i++) {
    const F: number = parseInt(readline());
    fs.push(F);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const results: string[] = fs.map(f => {
    let tempF: number = f;
    [5, 3, 2].forEach(i => {
        while (tempF % i === 0) {
            tempF /= i;
        }
    });

    return tempF === 1 ? 'VICTORY' : 'DEFEAT';
});

// console.log('DEFEAT');
results.forEach(result => {
    console.log(result);
});
