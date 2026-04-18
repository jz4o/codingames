/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const a: number = parseInt(inputs[0], 10);
const b: number = parseInt(inputs[1], 10);
const c: number = parseInt(inputs[2], 10);
const d: number = parseInt(inputs[3], 10);
const n: number = parseInt(readline(), 10);
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
    const [operator, arg0, arg1Key, arg2Key]: string[] = instructions[index].split(' ');
    const arg1: number = arg1Key in register ? register[arg1Key] : parseInt(arg1Key, 10);
    let arg2: number;
    if (arg2Key !== undefined) {
        arg2 = arg2Key in register ? register[arg2Key] : parseInt(arg2Key, 10);
    }

    if (operator === 'MOV') {
        register[arg0] = arg1;
    } else if (operator === 'ADD') {
        register[arg0] = arg1 + arg2;
    } else if (operator === 'SUB') {
        register[arg0] = arg1 - arg2;
    } else if (operator === 'JNE') {
        if (arg1 !== arg2) {
            index = parseInt(arg0, 10);
            continue;
        }
    }

    index++;
}

const result: string = `${register.a} ${register.b} ${register.c} ${register.d}`;

// console.log('a b c d');
console.log(result);

