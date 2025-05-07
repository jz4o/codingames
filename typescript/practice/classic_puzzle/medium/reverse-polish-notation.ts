/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const inputs: string[] = readline().split(' ');
const instructions: string[] = [];
for (let i = 0; i < N; i++) {
    const instruction: string = inputs[i];
    instructions.push(instruction);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const calcOperation: { [key: string]: (a: number, b: number) => number } = {
    'ADD': (a: number, b: number): number => a + b,
    'SUB': (a: number, b: number): number => a - b,
    'MUL': (a: number, b: number): number => a * b,
    'DIV': (a: number, b: number): number => Math.floor(a / b),
    'MOD': (a: number, b: number): number => a % b
};

const zeroCheckOperation: string[] = ['DIV', 'MOD'];

const stack: string[] = [];
instructions.some(instruction => {
    if (['ADD', 'SUB', 'MUL', 'DIV', 'MOD'].includes(instruction)) {
        const [lStr, rStr]: string[] = stack.splice(-2);
        if ([lStr, rStr].includes(undefined)) {
            stack.push('ERROR');
            return true;
        }

        const [lNumber, rNumber]: number[] = [lStr, rStr].map(s => parseInt(s));

        if (zeroCheckOperation.includes(instruction) && rNumber === 0) {
            stack.push('ERROR');
            return true;
        }

        const calcResult: number = calcOperation[instruction](lNumber, rNumber);

        stack.push(calcResult.toString());
    } else if (instruction === 'POP') {
        const lastStr: string = stack.pop();
        if (lastStr === undefined) {
            stack.push('ERROR');
            return true;
        }
    } else if (instruction === 'DUP') {
        const lastStr: string = stack.pop();
        if (lastStr === undefined) {
            stack.push('ERROR');
            return true;
        }

        stack.push(lastStr, lastStr);
    } else if (instruction === 'SWP') {
        const [lStr, rStr]: string[] = stack.splice(-2);
        if ([lStr, rStr].includes(undefined)) {
            stack.push('ERROR');
            return true;
        }

        stack.push(rStr, lStr);
    } else if (instruction === 'ROL') {
        const lastStr: string = stack.pop();
        if (lastStr === undefined) {
            stack.push('ERROR');
            return true;
        }

        const lastNumber: number = parseInt(lastStr);
        if (stack.length < lastNumber) {
            stack.splice(0);
            stack.push('ERROR');
            return true;
        }

        stack.push(...stack.splice(-lastNumber, 1));
    } else {
        stack.push(instruction);
    }

    return false;
});

const result: string = stack.join(' ');

// console.log('answer');
console.log(result);
