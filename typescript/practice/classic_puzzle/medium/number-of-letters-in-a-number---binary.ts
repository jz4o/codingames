/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

var inputs: string[] = readline().split(' ');
const start: number = parseInt(inputs[0]);
const n: number = parseInt(inputs[1]);

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

let temp: number = start;
for (let i = 0; i < n; i++) {
    const result: number = temp.toString(2)
                               .replace(/0/g, 'zero')
                               .replace(/1/g, 'one')
                               .length;

    if (temp === result) {
        break;
    }

    temp = result;
}

// console.log('42');
console.log(temp);
