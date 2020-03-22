/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const telephones: string[] = [];
for (let i = 0; i < N; i++) {
    const telephone: string = readline();

    telephones.push(telephone);
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const numberHash: {[key: string]: {}} = {};
telephones.forEach(telephone => {
    let targetHash: {[key: string]: {}} = numberHash;
    telephone.split('').forEach(num => {
        if (!(num in targetHash)) {
            targetHash[num] = {};
        }

        targetHash = targetHash[num];
    });
});

// The number of elements (referencing a number) stored in the structure.
// console.log('number');
console.log(JSON.stringify(numberHash).match(/:/g).length);
