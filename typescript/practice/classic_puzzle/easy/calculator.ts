/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const keys: string[] = [];
for (let i = 0; i < n; i++) {
    const key: string = readline();
    keys.push(key);
}
// for (let i = 0; i < n; i++) {
//
//     // Write an answer using console.log()
//     // To debug: console.error('Debug messages...');
//
//     console.log('answer');
// }

class Calculator {
    static #DECIMAL_PLACES: number = 3;

    num1: string;
    operation: string;
    num2: string;
    pressedEqual: boolean;
    display: string;

    constructor() {
        this.#init();
    }

    #init: () => void = (): void => {
        this.num1 = '';
        this.operation = '';
        this.num2 = '';
        this.pressedEqual = false;
        this.display = '';
    };

    getDisplay: () => string = (): string => {
        return this.display;
    };

    press: (key: string) => void = (key: string): void => {
        if ('0123456789'.includes(key)) {
            if (this.pressedEqual) {
                this.#init();
            }

            if (this.operation === '') {
                this.num1 += key;
                this.display = this.num1;
            } else {
                this.num2 += key;
                this.display = this.num2;
            }
        } else if ('+-x/'.includes(key)) {
            if (this.num2 !== '' && !this.pressedEqual) {
                this.#calc();
            }

            this.operation = key;

            this.num2 = '';
            this.pressedEqual = false;

            this.display = this.num1;
        } else if (key === '=') {
            this.pressedEqual = true;
            this.display = this.#calc();
        } else if (key === 'AC') {
            this.#init();
            this.display = '0';
        }
    };

    #calc: () => string = (): string => {
        const num1: number = this.num1 !== '' ? parseFloat(this.num1) : 0;
        const num2: number = this.num2 !== '' ? parseFloat(this.num2) : 0;

        let result: number;
        if (this.operation === '+') {
            result = num1 + num2;
        } else if (this.operation === '-') {
            result = num1 - num2;
        } else if (this.operation === 'x') {
            result = num1 * num2;
        } else if (this.operation === '/') {
            result = num1 / num2;
        } else {
            result = 0;
        }

        this.num1 = result
            .toFixed(Calculator.#DECIMAL_PLACES)
            .replace(/(\.[0-9]+?)0+$/, '$1')
            .replace(/\.0$/, '');

        return this.num1;
    };
}

const calculator: Calculator = new Calculator();
const results: string[] = keys.map(key => {
    calculator.press(key);

    return calculator.getDisplay();
});

results.forEach(result => {
    console.log(result);
});
