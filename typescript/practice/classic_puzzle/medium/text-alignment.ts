/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const alignment: string = readline();
const N: number = parseInt(readline());
const texts: string[] = [];
for (let i = 0; i < N; i++) {
    const text: string = readline();

    texts.push(text);
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
};

const repeatStr = (str: string, count: number): string => {
    return Array(count + 1).join(str);
};

const width: number = texts.map(i => i.length).reduce((max, i) => Math.max(max, i) , 0);

const results: string[] = [];
if (alignment === 'LEFT') {
    texts.forEach(text => {
        results.push(text);
    });
} else if (alignment === 'RIGHT') {
    texts.forEach(text => {
        const space: string = repeatStr(' ', width - text.length);
        results.push(`${space}${text}`);
    });
} else if (alignment === 'CENTER') {
    texts.forEach(text => {
        const space: string = repeatStr(' ', Math.floor((width - text.length + 1) / 2));
        results.push(`${space}${text}`);
    });
} else if (alignment === 'JUSTIFY') {
    texts.forEach(text => {
        if (text.length === width) {
            results.push(text);
            return;
        }

        const words: string[] = text.split(' ');
        const spaceSize: number = width - words.join('').length;
        const eachSpaceSize: number = spaceSize / (words.length - 1);
        const spaceSizes: number[] = rangeArrayFromTo(1, words.length - 1).map(i => {
            return Math.floor(eachSpaceSize * i) - Math.floor(eachSpaceSize * (i - 1));
        });

        const result: string = words.reduce((result, word, index) => {
            const space = index < spaceSizes.length ? repeatStr(' ', Math.floor(spaceSizes[index])) : '';
            return `${result}${word}${space}`;
        }, '');

        results.push(result);
    });
}

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
