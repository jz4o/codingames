/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const toconvert: string = readline();
const n: number = parseInt(readline());
const relations: string[] = [];
for (let i = 0; i < n; i++) {
    const relation: string = readline();
    relations.push(relation);
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

    static from: (numerator: number) => Fraction = (numerator: number): Fraction => {
        return new Fraction(numerator, 1);
    };

    mult: (other: Fraction) => Fraction = (other: Fraction): Fraction => {
        let numerator: number = this.numerator * other.numerator;
        let denominator: number = this.denominator * other.denominator;

        const gcd: number = Fraction.#gcd(numerator, denominator);

        numerator /= gcd;
        denominator /= gcd;

        return new Fraction(numerator, denominator);
    };

    static #gcd: (a: number, b: number) => number = (a: number, b: number): number => {
        const min: number = Math.min(a, b);
        const max: number = Math.max(a, b);

        if (min === 0) {
            return max;
        }

        return Fraction.#gcd(min, max % min);
    };
}

const [fromUnit, toUnit]: string[] = toconvert.split(' in ');

const relationObject: { [key: string]: string[] } = {};
const relationRates: { [key: string]: Fraction } = {};
const relationRegexp: RegExp = /(\d+)\s(.*)\s=\s(\d+)\s(.*)/;
relations.forEach(relation => {
    const [_, lSizeStr, lUnit, rSizeStr, rUnit]: string[] = relation.match(relationRegexp);
    const [lSize, rSize]: number[] = [lSizeStr, rSizeStr].map(s => parseInt(s));

    if (!(lUnit in relationObject)) {
        relationObject[lUnit] = [];
    }
    relationObject[lUnit].push(rUnit);

    if (!(rUnit in relationObject)) {
        relationObject[rUnit] = [];
    }
    relationObject[rUnit].push(lUnit);

    relationRates[`${lUnit}->${rUnit}`] = new Fraction(rSize, lSize);
    relationRates[`${rUnit}->${lUnit}`] = new Fraction(lSize, rSize);
});

const tempRelationPatterns: string[][] = [[fromUnit]];
let convertRelations: string[] = [];
while (convertRelations.length === 0 && tempRelationPatterns.length !== 0) {
    const tempRelationPattern: string[] = tempRelationPatterns.pop();

    const unit: string = tempRelationPattern[tempRelationPattern.length - 1];

    relationObject[unit].some(convertedUnit => {
        if (convertedUnit === toUnit) {
            convertRelations = [...tempRelationPattern, convertedUnit];
            return true;
        }

        if (!tempRelationPattern.includes(convertedUnit)) {
            tempRelationPatterns.push([...tempRelationPattern, convertedUnit]);
        }
    });
}

const toFraction: Fraction = [...Array(convertRelations.length - 1).keys()].reduce((toFraction, i) => {
    const [f, t]: string[] = convertRelations.slice(i, i + 2);

    return toFraction.mult(relationRates[`${f}->${t}`]);
}, Fraction.from(1));

const fromSize: number = toFraction.denominator;
const toSize: number = toFraction.numerator;

const result: string = `${fromSize} ${fromUnit} = ${toSize} ${toUnit}`;

// console.log('result');
console.log(result);
