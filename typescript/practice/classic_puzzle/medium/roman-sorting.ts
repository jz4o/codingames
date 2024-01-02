/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const xs: number[] = [];
for (let i = 0; i < n; i++) {
    const x: number = parseInt(readline());
    xs.push(x);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class ArabiaRoman {
    static #toRomanCache: { [key: number]: string } = {};

    static toRoman: (arabia: number) => string = (arabia: number): string => {
        const cachedResult: string = this.#toRomanCache[arabia];
        if (cachedResult) {
            return cachedResult;
        }

        const VALUES: [number, string][] = [
            [1000, 'M'],
            [500, 'D'],
            [100, 'C'],
            [50, 'L'],
            [10, 'X'],
            [5, 'V'],
            [1, 'I']
        ];

        const SUBTRACTIVE_NOTATION: [string, string][] = [
            ['DCCCC', 'CM'],
            ['CCCC', 'CD'],
            ['LXXXX', 'XC'],
            ['XXXX', 'XL'],
            ['VIIII', 'IX'],
            ['IIII', 'IV']
        ];

        let tempArabia: number = arabia;
        const inefficientRoman: string = VALUES.reduce((result, [value, roman]) => {
            const romanCount: number = Math.floor(tempArabia / value);
            tempArabia = tempArabia % value;

            return result + roman.repeat(romanCount);
        }, '');

        const roman: string = SUBTRACTIVE_NOTATION.reduce((result, [variant, subtractive]) => {
            return result.replace(variant, subtractive);
        }, inefficientRoman);

        this.#toRomanCache[arabia] = roman;

        return roman;
    };
}

const result: string = xs.sort((a, b) => ArabiaRoman.toRoman(a) > ArabiaRoman.toRoman(b) ? 1 : -1).join(' ');

// console.log('50 60 40');
console.log(result);
