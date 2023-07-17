/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const rows: string[] = [];
for (let i = 0; i < N; i++) {
    const ROW: string = readline();
    rows.push(ROW);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class TileFloor {
    static create = (patternParts: string[]): string[] => {
        const patternPartsSize: number = patternParts.length;
        const borderRow: string = `+${'-'.repeat(patternPartsSize * 2 - 1)}+${'-'.repeat(patternPartsSize * 2 - 1)}+`;

        const patternRows: string[] = TileFloor.reverseVertical(TileFloor.reverseHorizontal(patternParts))
            .map(patternRow => `|${patternRow}|${patternRow}|`);

        return [borderRow, patternRows, borderRow, patternRows, borderRow].flat();
    }

    private static reverseHorizontal = (patternPartsRows: string[]): string[] => {
        return patternPartsRows.map(patternPartsRow => {
            const replaceMap: { [key: string]: string } = {
                '(': ')',
                ')': '(',
                '{': '}',
                '}': '{',
                '[': ']',
                ']': '[',
                '<': '>',
                '>': '<',
                '/': '\\',
                '\\': '/'
            };

            const reversePatternPartsRow: string = patternPartsRow
                .split('')
                .reverse()
                .map(char => replaceMap[char] || char)
                .join('');

            return [patternPartsRow, reversePatternPartsRow.slice(1)].join('');
        });
    }

    private static reverseVertical = (patternPartsRows: string[]): string[] => {
        const replaceMap: { [key: string]: string } = {
            '^': 'v',
            'v': '^',
            'A': 'V',
            'V': 'A',
            'w': 'm',
            'm': 'w',
            'W': 'M',
            'M': 'W',
            'u': 'n',
            'n': 'u',
            '/': '\\',
            '\\': '/'
        };

        const reversePatternPartsRows: string[] = [...patternPartsRows].reverse().map(reversePatternPartsRow => {
            return reversePatternPartsRow.split('').map(char => replaceMap[char] || char).join('');
        });

        return patternPartsRows.concat(reversePatternPartsRows.slice(1));
    }
}

const results: string[] = TileFloor.create(rows);

// console.log('TileFloor');
results.forEach(result => {
    console.log(result);
});
