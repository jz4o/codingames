/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const lines: string[] = [];
for (let i = 0; i < N; i++) {
    const line: string = readline();
    lines.push(line);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Fraction {
    numerator: number;
    denominator: number;

    constructor(numerator: number, denominator: number) {
        this.numerator = numerator;
        this.denominator = denominator;
    }

    static fromString: (num: string) => Fraction = (num: string): Fraction => {
        const [numerator, denominator]: number[] = num.split('/').map(n => parseInt(n));

        return new Fraction(numerator, denominator);
    }

    static fromDirections: (directions: string) => Fraction = (directions: string): Fraction => {
        let minFraction: Fraction = new Fraction(0, 1);
        let maxFraction: Fraction = new Fraction(1, 0);
        const targetFraction: Fraction = new Fraction(1, 1);

        directions.split('').forEach(direction => {
            if (direction === 'L') {
                maxFraction = targetFraction.copy();
            } else {
                minFraction = targetFraction.copy();
            }

            targetFraction.numerator = minFraction.numerator + maxFraction.numerator;
            targetFraction.denominator = minFraction.denominator + maxFraction.denominator;
        });

        return targetFraction;
    }

    toDirections: () => string = (): string => {
        let minFraction: Fraction = new Fraction(0, 1);
        let maxFraction: Fraction = new Fraction(1, 0);
        const targetFraction: Fraction = new Fraction(1, 1);

        const results: string[] = [];
        while (this.isNotEqual(targetFraction)) {
            if (this.isLessThan(targetFraction)) {
                maxFraction = targetFraction.copy();
                results.push('L');
            } else {
                minFraction = targetFraction.copy();
                results.push('R');
            }

            targetFraction.numerator = minFraction.numerator + maxFraction.numerator;
            targetFraction.denominator = minFraction.denominator + maxFraction.denominator;
        }

        const result: string = results.join('');

        return result;
    }

    isNotEqual: (other: Fraction) => boolean = (other: Fraction): boolean => {
        return this.toFloat() !== other.toFloat();
    }

    isLessThan: (other: Fraction) => boolean = (other: Fraction): boolean => {
        return this.toFloat() < other.toFloat();
    }

    toFloat: () => number = (): number => {
        return this.numerator / this.denominator;
    }

    copy: () => Fraction = (): Fraction => {
        return new Fraction(this.numerator, this.denominator);
    }

    toString: () => string = (): string => {
        return `${this.numerator}/${this.denominator}`;
    }
}

const fractionRegexp: RegExp = /^\d+\/\d+$/;
const results: string[] = lines.map(line => {
    return fractionRegexp.test(line)
        ? Fraction.fromString(line).toDirections()
        : Fraction.fromDirections(line).toString();
});

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
