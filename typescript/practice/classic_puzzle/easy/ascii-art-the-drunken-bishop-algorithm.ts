/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const fingerprint: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const eachSlice: <T>(array: T[], size: number) => T[][] = <T>(array: T[], size: number): T[][] => {
    return [...Array(Math.ceil(array.length / size)).keys()].map(i => array.slice(i * size, i * size + size));
};

class Bishop {
    static #ART_MAX_HEIGHT: number = 8;
    static #ART_MAX_WIDTH: number = 16;
    static #SYMBOLS: string = ' .o+=*BOX@%&#/^';

    static #counter: { [key: string]: number };
    static #startY: number;
    static #startX: number;
    static #endY: number;
    static #endX: number;

    static drawArt: (fingerprint: string) => string[] = (fingerprint: string): string[] => {
        this.#walk(fingerprint);

        const asciiArtGrid: string[][] = [...Array(this.#ART_MAX_HEIGHT + 1).keys()].map(y => {
            return [...Array(this.#ART_MAX_WIDTH + 1).keys()].map(x => {
                return this.#SYMBOLS[this.#counter[`${y}:${x}`] || 0];
            });
        });

        asciiArtGrid[this.#startY][this.#startX] = 'S';
        asciiArtGrid[this.#endY][this.#endX] = 'E';

        const asciiArt: string[] = asciiArtGrid.map(asciiRow => {
            return `|${asciiRow.join('')}|`;
        });
        asciiArt.unshift('+---[CODINGAME]---+');
        asciiArt.push('+-----------------+');

        return asciiArt;
    };

    static #walk: (fingerprint: string) => void = (fingerprint: string): void => {
        this.#counter = {};

        let positionY: number = 4;
        let positionX: number = 8;

        this.#startY = positionY;
        this.#startX = positionX;

        eachSlice(fingerprint.replace(/:/g, '').split(''), 2).forEach(hexa => {
            eachSlice(hexa.map(h => parseInt(h, 16).toString(2).padStart(4, '0')).join('').split('').reverse(), 2).forEach(([x, y]) => {
                positionY = y === '0' ? Math.max(positionY - 1, 0) : Math.min(positionY + 1, this.#ART_MAX_HEIGHT);
                positionX = x === '0' ? Math.max(positionX - 1, 0) : Math.min(positionX + 1, this.#ART_MAX_WIDTH);

                const counterKey: string = `${positionY}:${positionX}`;
                this.#counter[counterKey] = ((this.#counter[counterKey] || 0) + 1) % this.#SYMBOLS.length;
            });
        });

        this.#endY = positionY;
        this.#endX = positionX;
    };
}

const results: string[] = Bishop.drawArt(fingerprint);

// console.log('ASCII Art Image');
results.forEach(result => {
    console.log(result);
});
