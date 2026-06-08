/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const num1Lines: string[] = [];
for (let i = 0; i < 5; i++) {
    const num1Line: string = readline();
    num1Lines.push(num1Line);
}
const num2Lines: string[] = [];
for (let i = 0; i < 5; i++) {
    const num2Line: string = readline();
    num2Lines.push(num2Line);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class CharMap {
    row: number;
    column: number;

    constructor(row: number, column: number) {
        this.row = row;
        this.column = column;
    }
}

interface PlaceCharMap {
    chars: string[];
    maps: CharMap[];
}

class CistercianNumeral {
    static PLACE_CHAR_MAP: { [key: string]: PlaceCharMap } = {
        ones: {
            chars: ['   ', '_  ', ' _ ', ' \\ ', ' / ', '_/ ', '  |', '_ |', ' _|', '__|'],
            maps: [new CharMap(0, 3), new CharMap(1, 3), new CharMap(1, 4)],
        },
        tens: {
            chars: ['   ', '_  ', '  _', '  /', '  \\', '_ \\', ' | ', '_| ', ' |_', '_|_'],
            maps: [new CharMap(0, 1), new CharMap(1, 0), new CharMap(1, 1)],
        },
        hundreds: {
            chars: ['    ', ' _  ', '_   ', ' /  ', ' \\  ', ' \\ ‾', '  | ', ' _| ', '_ | ', '__| '],
            maps: [new CharMap(2, 3), new CharMap(3, 3), new CharMap(3, 4), new CharMap(4, 3)],
        },
        thousands: {
            chars: ['    ', '  _ ', '_   ', '  \\ ', '  / ', '  /‾', ' |  ', ' |_ ', '_|  ', '_|_ '],
            maps: [new CharMap(2, 1), new CharMap(3, 0), new CharMap(3, 1), new CharMap(4, 1)],
        },
    };

    static toArabic: (cistercianLines: string[]) => number = (cistercianLines: string[]): number => {
        const grid: string[][] = cistercianLines.map(cistercianLine => {
            return cistercianLine.split('');
        });

        const placeNums: number[] = ['thousands', 'hundreds', 'tens', 'ones'].map(placeKey => {
            const charMap: PlaceCharMap = this.PLACE_CHAR_MAP[placeKey];
            const char: string = charMap.maps.map(m => grid[m.row][m.column]).join('');

            return charMap.chars.indexOf(char);
        });

        return parseInt(placeNums.join(''), 10);
    };

    static fromArabic: (num: number) => string[] = (num: number): string[] => {
        const grid: string[][] = [
            '     ',
            '  |  ',
            '  |  ',
            '  |  ',
            '     ',
        ].map(row => row.split(''));

        const [ones, tens, hundreds, thousands]: number[] = num.toString().split('').reverse().map(c => parseInt(c, 10));
        const placeNums: { [key: string]: number } = {
            ones: ones || 0,
            tens: tens || 0,
            hundreds: hundreds || 0,
            thousands: thousands || 0,
        };

        Object.entries(placeNums).forEach(([placeKey, placeNum]) => {
            const charMap: PlaceCharMap = this.PLACE_CHAR_MAP[placeKey];

            const placeChar: string = charMap.chars[placeNum];
            placeChar.split('').forEach((char, index) => {
                const m: CharMap = charMap.maps[index];
                grid[m.row][m.column] = char;
            });
        });

        return grid.map(row => row.join(''));
    };
}

const num1: number = CistercianNumeral.toArabic(num1Lines);
const num2: number = CistercianNumeral.toArabic(num2Lines);

const addition: number = num1 + num2;

const results: string[] = CistercianNumeral.fromArabic(addition);

// console.log('result');
results.forEach(result => {
    console.log(result);
});
