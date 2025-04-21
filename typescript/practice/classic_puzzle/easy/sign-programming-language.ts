/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const program: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const instructionRegexp: { [key: string]: RegExp } = {
    add: /\/\$.*?\//,
    sub: /\/\/.*?\//,
    mulPlusOne: /\/\*\*.*?\//,
    mulMinus: /\/\*\/.*?\//,
    nop: /\/\*\$/,
    addInstCount: /\$/
};

const unionRegexpSource: string = Object.values(instructionRegexp).map(regexp => `(${regexp.source})`).join('|');
const instructions: string[] = program.match(new RegExp(unionRegexpSource, 'g'));

let register: number = 0;
let instCount: number = 0;
let isInstCounting: boolean = false;
instructions.forEach(instruction => {
    if (new RegExp(`^${instructionRegexp.add.source}$`).test(instruction)) {
        register += instruction.length - 3;
        instCount++;
    } else if (new RegExp(`^${instructionRegexp.sub.source}$`).test(instruction)) {
        register -= (instruction.length - 3);
        instCount++;
    } else if (new RegExp(`^${instructionRegexp.mulPlusOne.source}$`).test(instruction)) {
        register *= (instruction.length - 4 + 1);
        instCount++;
    } else if (new RegExp(`^${instructionRegexp.mulMinus.source}$`).test(instruction)) {
        register *= ((instruction.length - 4) * -1);
        instCount++;
    } else if (new RegExp(`^${instructionRegexp.nop.source}$`).test(instruction)) {
        instCount++;
    } else if (new RegExp(`^${instructionRegexp.addInstCount.source}$`).test(instruction)) {
        if (isInstCounting) {
            register += instCount;
        }

        instCount = 0;
        isInstCounting = !isInstCounting;
    }
});

const result: string = register.toString();

// console.log('answer');
console.log(result);
