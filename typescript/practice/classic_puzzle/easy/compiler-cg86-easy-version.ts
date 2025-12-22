/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const expression: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Instruction {
    typeValue: string;
    operand: string;

    constructor(typeValue: string, operand: string) {
        this.typeValue = typeValue;
        this.operand = operand;
    }

    isEqual: (other: Instruction) => boolean = (other: Instruction): boolean => {
        return (
            other instanceof Instruction
            && this.typeValue === other.typeValue
            && this.operand === other.operand
        );
    };
}

const eachSlice: <T>(array: T[], n: number) => T[][] = <T>(array: T[], n: number): T[][] => {
    return [...Array(Math.ceil(array.length / n)).keys()].map(i => array.slice(i * n, i * n + n));
};

const expressionElements: string[] = expression.split(' ');
if (/\d/.test(expressionElements[0])) {
    expressionElements.unshift('+');
}

let instructions: Instruction[] = eachSlice(expressionElements, 2).map(([typeValue, operand]) => {
    return new Instruction(typeValue, operand);
});

const results: string[] = [];
while (instructions.length > 0) {
    const [instruction]: Instruction[] = instructions;
    const repeatCount: number = instructions.filter(inst => inst.isEqual(instruction)).length;
    if (repeatCount > 1) {
        results.push(`REPEAT ${repeatCount}`);
    }

    results.push(`${instruction.typeValue === '+' ? 'ADD' : 'SUB'} cgx ${instruction.operand}`);

    instructions = instructions.filter(inst => !inst.isEqual(instruction));
}
results.push('EXIT');

// console.log('ADD cgx 1');
// console.log('write EXIT');
results.forEach(result => {
    console.log(result);
});
