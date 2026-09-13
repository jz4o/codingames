/**
 * Decode and execute the MiniCPU bytecode program.
 **/

const program: string = readline(); // Space-separated hex bytes representing CPU instructions

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class MiniCpu {
    static BIT_SIZE: number = 256;

    static register: { [key: string]: number };

    static exec: (program: string) => string[] = (program: string): string[] => {
        type Instruction = {
            code: string,
            operation: (...args: [registerNumber: string] | [registerNumber: string, value: number] | [registerNumber1: string, registerNUmber2: string]) => void,
        }
        const instructions: { [key: string]: Instruction } = {
            mov: {
                code: '01',
                operation: this.mov,
            },
            add: {
                code: '02',
                operation: this.add,
            },
            sub: {
                code: '03',
                operation: this.sub,
            },
            mul: {
                code: '04',
                operation: this.mul,
            },
            inc: {
                code: '05',
                operation: this.inc,
            },
            dec: {
                code: '06',
                operation: this.dec,
            },
            hlt: {
                code: 'FF',
                operation: null,
            },
        };

        const registerNumbers: string[] = ['00', '01', '02', '03'];

        this.register = {};
        registerNumbers.forEach(key => this.register[key] = 0);

        const bytes: string[] = program.split(' ');
        while (bytes.length > 0) {
            const code: string = bytes.shift();
            const instruction: Instruction = Object.values(instructions).find(instruction => instruction.code === code);
            if (instruction === instructions.hlt) {
                break;
            }

            if (instruction === instructions.mov) {
                const registerNumber: string = bytes.shift();
                const valueStr: string = bytes.shift();
                const value: number = parseInt(valueStr, 16);

                instruction.operation(registerNumber, value);
            } else if ([instructions.add, instructions.sub, instructions.mul].includes(instruction)) {
                const registerNumber: string = bytes.shift();
                const value: string = bytes.shift();

                instruction.operation(registerNumber, value);
            } else if ([instructions.inc, instructions.dec].includes(instruction)) {
                const registerNumber: string = bytes.shift();
                instruction.operation(registerNumber);
            }
        }

        return registerNumbers.map(registerNumber => {
            return (this.register[registerNumber] % 256).toString();
        });
    };

    static mov: (registerNumber: string, value: number) => void = (registerNumber: string, value: number): void => {
        this.register[registerNumber] = value;
    };

    static add: (registerNumber1: string, registerNumber2: string) => void = (registerNumber1: string, registerNumber2: string): void => {
        this.register[registerNumber1] = (this.register[registerNumber1] + this.register[registerNumber2]) % this.BIT_SIZE;
    };

    static sub: (registerNumber1: string, registerNumber2: string) => void = (registerNumber1: string, registerNumber2: string): void => {
        this.register[registerNumber1] = (this.register[registerNumber1] - this.register[registerNumber2] + this.BIT_SIZE) % this.BIT_SIZE;
    };

    static mul: (registerNumber1: string, registerNumber2: string) => void = (registerNumber1: string, registerNumber2: string): void => {
        this.register[registerNumber1] = (this.register[registerNumber1] * this.register[registerNumber2]) % this.BIT_SIZE;
    };

    static inc: (registerNumber: string) => void = (registerNumber1: string): void => {
        this.register[registerNumber1] = (this.register[registerNumber1] + 1) % this.BIT_SIZE;
    };

    static dec: (registerNumber: string) => void = (registerNumber1: string): void => {
        this.register[registerNumber1] = (this.register[registerNumber1] - 1 + this.BIT_SIZE) % this.BIT_SIZE;
    };
}

const results: string[] = MiniCpu.exec(program);

// Print the final value of each register R0, R1, R2, R3, one value per line
// console.log('answer');
results.forEach(result => {
    console.log(result);
});
