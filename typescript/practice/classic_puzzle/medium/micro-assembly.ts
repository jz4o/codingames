/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

var inputs: string[] = readline().split(' ');
let a: number = parseInt(inputs[0]);
let b: number = parseInt(inputs[1]);
let c: number = parseInt(inputs[2]);
let d: number = parseInt(inputs[3]);
const n: number = parseInt(readline());
const instructions: string[] = [];
for (let i = 0; i < n; i++) {
    const instruction: string = readline();

    instructions.push(instruction);
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

let index: number = 0;
while (index < instructions.length) {
    const args: string[] = instructions[index].split(' ')
    const operator: string = args.shift();

    // convert positive and negative for substract by addition
    if (operator === 'SUB') {
        args[2] = `-${args[2]}`.replace('--', '');
    }

    if (operator === 'JNE') {
        if (eval(`${args[1]} !== ${args[2]}`)) {
            index = parseInt(args[0]);
            continue;
        }
    } else {
        eval(`${args[0]} = ${args[1]} + ${args[2] || 0}`);
    }

    index++;
}

// console.log('a b c d');
console.log(`${a} ${b} ${c} ${d}`);
