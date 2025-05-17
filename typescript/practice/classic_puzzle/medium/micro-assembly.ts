/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const a: number = parseInt(inputs[0]);
const b: number = parseInt(inputs[1]);
const c: number = parseInt(inputs[2]);
const d: number = parseInt(inputs[3]);
const n: number = parseInt(readline());
const instructions: string[] = [];
for (let i = 0; i < n; i++) {
    const instruction: string = readline();

    instructions.push(instruction);
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

interface Register {
    a: number;
    b: number;
    c: number;
    d: number;
};

const register: Register = { a, b, c, d };

let index: number = 0;
while (index < instructions.length) {
    const args: string[] = instructions[index].split(' ');
    const operator: string = args[0];
    const arg0: string = args[1];
    const arg1: number = register[args[2]] !== undefined ? register[args[2]] : parseInt(args[2]);
    let arg2: number;
    if (4 <= args.length) {
        arg2 = register[args[3]] !== undefined ? register[args[3]] : parseInt(args[3]);
    }

    if (operator === 'MOV') {
        register[arg0] = arg1;
    } else if (operator === 'ADD') {
        register[arg0] = arg1 + arg2;
    } else if (operator === 'SUB') {
        register[arg0] = arg1 - arg2;
    } else if (operator === 'JNE') {
        if (arg1 !== arg2) {
            index = parseInt(arg0);
            continue;
        }
    }

    index++;
}

const result: string = `${register.a} ${register.b} ${register.c} ${register.d}`;

// console.log('a b c d');
console.log(result);
