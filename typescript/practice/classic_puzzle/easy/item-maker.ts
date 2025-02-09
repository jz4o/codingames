/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const data: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

interface Item {
    name: string;
    rarity: string;
    attributes: string[];
};

interface Frame {
    topLeftParts: string;
    topParts: string;
    topRightParts: string;
    bodySideParts: string;
    bottomLeftParts: string;
    bottomParts: string;
    bottomRightParts: string;
}

class ItemInterface {
    static createAscii: (item: Item) => string[] = (item: Item): string[] => {
        const asciiRows: string[] = this.createAsciiRows(item);
        return this.surroundWithFrame(asciiRows, item.rarity);
    };

    static createAsciiRows: (item: Item) => string[] = (item: Item): string[] => {
        const name: string = `-${item.name}-`;
        const rarity: string = item.rarity;
        const attributes: string[] = item.attributes;

        const width: number = Math.max(...[name, rarity, ...attributes].map(elm => elm.length));

        const nameSpaceSize: number = width - name.length;
        const raritySpaceSize: number = width - rarity.length;

        const asciiRows: string[] = [];
        asciiRows.push(`${' '.repeat(Math.ceil(nameSpaceSize / 2))}${name}${' '.repeat(Math.floor(nameSpaceSize / 2))}`);
        asciiRows.push(`${' '.repeat(Math.ceil(raritySpaceSize / 2))}${rarity}${' '.repeat(Math.floor(raritySpaceSize / 2))}`);
        asciiRows.push(...item.attributes.map(attribute => attribute.replace(':', ' ').padEnd(width, ' ')));

        return asciiRows;
    };

    static surroundWithFrame: (asciiRows: string[], rarity: string) => string[] = (asciiRows: string[], rarity: string): string[] => {
        const width: number = asciiRows[0].length + (2 * 2);

        const frames: {[key: string]: Frame} = {
            Common: {topLeftParts: '#', topParts: '#', topRightParts: '#', bodySideParts: '#', bottomLeftParts: '#', bottomParts: '#', bottomRightParts: '#'},
            Rare: {topLeftParts: '/', topParts: '#', topRightParts: '\\', bodySideParts: '#', bottomLeftParts: '\\', bottomParts: '#', bottomRightParts: '/'},
            Epic: {topLeftParts: '/', topParts: '-', topRightParts: '\\', bodySideParts: '|', bottomLeftParts: '\\', bottomParts: '_', bottomRightParts: '/'},
            Legendary: {topLeftParts: 'X', topParts: '-', topRightParts: 'X', bodySideParts: '|', bottomLeftParts: 'X', bottomParts: '_', bottomRightParts: 'X'}
        };
        const frame: Frame = frames[rarity];

        const resultAsciiRows: string[] = asciiRows.map(asciiRow => `${frame.bodySideParts} ${asciiRow} ${frame.bodySideParts}`);
        resultAsciiRows.unshift(`${frame.topLeftParts}${frame.topParts.repeat(width - 2)}${frame.topRightParts}`);
        resultAsciiRows.push(`${frame.bottomLeftParts}${frame.bottomParts.repeat(width - 2)}${frame.bottomRightParts}`);

        if (rarity === 'Legendary') {
            const nameRowIndex: number = 1;
            resultAsciiRows[nameRowIndex] = `[${resultAsciiRows[nameRowIndex].slice(1, -1)}]`;

            const centerIndex: number = Math.floor(width / 2);
            if (width % 2 === 0) {
                resultAsciiRows[0] = `${resultAsciiRows[0].slice(0, centerIndex - 2)}\\__/${resultAsciiRows[0].slice(centerIndex + 2)}`;
            } else {
                resultAsciiRows[0] = `${resultAsciiRows[0].slice(0, centerIndex - 1)}\\_/${resultAsciiRows[0].slice(centerIndex + 2)}`;
            }
        }

        return resultAsciiRows;
    };
}

const [name, rarity, ...attributes] = data.split(',');
const item: Item = {name, rarity, attributes};
const results: string[] = ItemInterface.createAscii(item);

// console.log('A ready-to-play item!');
results.forEach(result => {
    console.log(result);
});
