/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const inputs: string[] = readline().split(' ');
const ls: number[] = [];
for (let i = 0; i < N; i++) {
    const l: number = parseInt(inputs[i]);

    ls.push(l);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const lists: number[][] = [];
ls.forEach(i => {
    lists.forEach(list => {
        if (list[list.length - 1] + 1 === i) {
            list.push(i);
        }
    });

    lists.push([i]);
});

const maxSize: number = lists.reduce((max, list) => Math.max(max, list.length), 0);
const result: string = lists.reverse().find(list => list.length === maxSize).join(' ');

// console.log('1 2 3 4 5');
console.log(result);
