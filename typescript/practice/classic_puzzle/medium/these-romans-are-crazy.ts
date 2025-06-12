/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const rom1: string = readline();
const rom2: string = readline();

class Roman {
    static fromArabia: (arabia: number) => string = (arabia: number): string => {
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
            tempArabia %= value;

            return result + roman.repeat(romanCount);
        }, '');

        const roman: string = SUBTRACTIVE_NOTATION.reduce((result, [variant, subtractive]) => {
            return result.replace(variant, subtractive);
        }, inefficientRoman);

        return roman;
    };

    static toArabia: (roman: string) => number = (roman: string): number => {
        const VALUES: { [key: string]: number } = {
            'I': 1,
            'V': 5,
            'X': 10,
            'L': 50,
            'C': 100,
            'D': 500,
            'M': 1000
        };

        const SUBTRACTIVE_NOTATION: [string, string][] = [
            ['CM', 'DCCCC'],
            ['CD', 'CCCC'],
            ['XC', 'LXXXX'],
            ['XL', 'XXXX'],
            ['IX', 'VIIII'],
            ['IV', 'IIII']
        ];

        const inefficientRoman: string = SUBTRACTIVE_NOTATION.reduce((result, [subtractive, variant]) => {
            return result.replace(subtractive, variant);
        }, roman);

        const arabia: number = inefficientRoman.split('').reduce((result, r) => result + VALUES[r], 0);

        return arabia;
    };
}

const arabia1: number = Roman.toArabia(rom1);
const arabia2: number = Roman.toArabia(rom2);

const result: string = Roman.fromArabia(arabia1 + arabia2);

console.log(result);

