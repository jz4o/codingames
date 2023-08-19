/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const quarterSize: number = parseInt(readline());
const rows: string[] = [];
for (let i = 0; i < quarterSize; i++) {
    const ROW: string = readline();
    rows.push(ROW);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class TileFloor {
    static create = (patternParts: string[]): string[] => {
        const patternPartsSize: number = patternParts.length;
        const borderRow: string = `+${'-'.repeat(patternPartsSize * 2)}+${'-'.repeat(patternPartsSize * 2)}+`;

        let patternRows: string[] = TileFloor.reverseHorizontal(patternParts);
        patternRows = TileFloor.reverseVertical(patternRows);
        patternRows = patternRows.map(patternRow => `|${patternRow}|${patternRow}|`);

        return [borderRow, ...patternRows, borderRow, ...patternRows, borderRow];
    };

    static reverseHorizontal = (patternPartsRows: string[]): string[] => {
        const replaceObject: { [key: string]: string } = {
            'b': 'd',
            'd': 'b',
            'p': 'q',
            'q': 'p',
            '/': '\\',
            '\\': '/'
        };

        return patternPartsRows.map(patternPartsRow => {
            const reversePatternPartsRow: string = patternPartsRow
                .split('')
                .reverse()
                .map(char => char in replaceObject ? replaceObject[char] : char)
                .join('');

            return [patternPartsRow, reversePatternPartsRow].join('');
        });
    };

    static reverseVertical = (patternPartsRows: string[]): string[] => {
        const replaceObject: { [key: string]: string } = {
            'b': 'p',
            'd': 'q',
            'p': 'b',
            'q': 'd',
            '/': '\\',
            '\\': '/'
        };

        const reversePatternPartsRows: string[] = [...patternPartsRows].reverse().map(reversePatternPartsRow => {
            return reversePatternPartsRow
                .split('')
                .map(char => char in replaceObject ? replaceObject[char] : char)
                .join('');
        });

        return patternPartsRows.concat(reversePatternPartsRows);
    };
}

const results: string[] = TileFloor.create(rows);

// console.log('Tile Floor');
results.forEach(result => {
    console.log(result);
});
