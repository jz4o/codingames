/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const L: number = parseInt(inputs[0]);
const H: number = parseInt(inputs[1]);
const transposeAsciiMayans: string[][] = [];
for (let i = 0; i < H; i++) {
    const numeral: string = readline();

    transposeAsciiMayans.push(numeral.match(new RegExp(`.{${L}}`, 'g')));
}
const mayans1: string[] = [];
const S1: number = parseInt(readline());
for (let i = 0; i < S1; i++) {
    const num1Line: string = readline();

    mayans1.push(num1Line);
}
const mayans2: string[] = [];
const S2: number = parseInt(readline());
for (let i = 0; i < S2; i++) {
    const num2Line: string = readline();

    mayans2.push(num2Line);
}
const operation: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const transpose = array => array[0].map((_value, index) => array.map(row => row[index]));

const sliceN = <T>(array: T[], sliceSize: number): T[][] => {
    const result: T[][] = [];

    let startIndex = 0;
    while (startIndex < array.length) {
        result.push(array.slice(startIndex, startIndex + sliceSize));
        startIndex += sliceSize;
    }

    return result;
};

class MayanConverter {
    asciiMayans: string[];
    asciiMayanHeight: number;
    asciiMayanWidth: number;

    constructor(asciiMayans: string[], asciiMayanHeight: number, asciiMayanWidth: number) {
        this.asciiMayans = asciiMayans;
        this.asciiMayanHeight = asciiMayanHeight;
        this.asciiMayanWidth = asciiMayanWidth;
    }

    mayansToNum: (mayans: string[]) => number = (mayans: string[]): number => {
        const mayanIndexes: number[] = sliceN(mayans, this.asciiMayanHeight).map(mayan => {
            return this.asciiMayans.indexOf(mayan.join(''));
        }).reverse();

        const num: number = mayanIndexes.reduce((sum, mayanIndex, index) => {
            const radix: number = this.asciiMayans.length ** index;
            return sum + radix * mayanIndex;
        }, 0);

        return num;
    };

    numToMayans: (num: number) => string[] = (num: number): string[] => {
        return num.toString(this.asciiMayans.length).split('').reduce((results, char) => {
            const mayan: string = this.asciiMayans[parseInt(char, this.asciiMayans.length)];
            results.push(...mayan.match(new RegExp(`.{${L}}`, 'g')));

            return results;
        }, []);
    };
}

const asciiMayans: string[] = transpose(transposeAsciiMayans).map(line => line.join(''));
const mayanConverter: MayanConverter = new MayanConverter(asciiMayans, H, L);

const num1: number = mayanConverter.mayansToNum(mayans1);
const num2: number = mayanConverter.mayansToNum(mayans2);

let result: number;
if (operation === '+') {
    result = num1 + num2;
} else if (operation === '-') {
    result = num1 - num2;
} else if (operation === '*') {
    result = num1 * num2;
} else if (operation === '/') {
    result = Math.trunc(num1 / num2);
}

const results: string[] = mayanConverter.numToMayans(result);

// console.log('result');
results.forEach(result => {
    console.log(result);
});

