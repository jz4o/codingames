/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const type: string = readline();
const nbLinesV1: number = parseInt(readline(), 10);
const lineV1s: string[] = [];
for (let i = 0; i < nbLinesV1; i++) {
    const lineV1: string = readline();
    lineV1s.push(lineV1);
}
const nbLinesV2: number = parseInt(readline(), 10);
const lineV2s: string[] = [];
for (let i = 0; i < nbLinesV2; i++) {
    const lineV2: string = readline();
    lineV2s.push(lineV2);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const getDiffByNumber: (beforeLines: string[], afterLines: string[]) => string[] = (beforeLines: string[], afterLines: string[]): string[] => {
    const addOrDeleteLines: string[] = [];
    if (beforeLines.length < afterLines.length) {
        const addLines: string[] = afterLines.slice(beforeLines.length).map(line => `ADD: ${line}`);
        addOrDeleteLines.push(...addLines);
    } else if (afterLines.length < beforeLines.length) {
        const deleteLines: string[] = beforeLines.slice(afterLines.length).map(line => `DELETE: ${line}`);
        addOrDeleteLines.push(...deleteLines);
    }

    const checkSize: number = Math.min(beforeLines.length, afterLines.length);
    const changeLines: string[] = beforeLines.slice(0, checkSize).flatMap((line, index) => {
        const afterLine: string = afterLines[index];
        if (line === afterLine) {
            return [];
        }

        return `CHANGE: ${line} ---> ${afterLine}`;
    });

    const results: string[] = [
        ...addOrDeleteLines,
        ...changeLines,
    ];

    return results.length > 0 ? results.sort() : ['No Diffs'];
};

const getDiffByContent: (beforeLines: string[], afterLines: string[]) => string[] = (beforeLines: string[], afterLines: string[]): string[] => {
    const addLines: string[] = afterLines.filter(line => !beforeLines.includes(line));
    const deleteLines: string[] = beforeLines.filter(line => !afterLines.includes(line));

    const moveLines: string[] = beforeLines.flatMap((line, index) => {
        if (addLines.includes(line) || deleteLines.includes(line)) {
            return [];
        }
        if (line === afterLines[index]) {
            return [];
        }

        const fromIndex: number = index + 1;
        const toIndex: number = afterLines.indexOf(line) + 1;

        return `MOVE: ${line} @:${fromIndex} >>> @:${toIndex}`;
    });

    const results: string[] = [
        ...addLines.map(line => `ADD: ${line}`),
        ...deleteLines.map(line => `DELETE: ${line}`),
        ...moveLines,
    ];

    return results.length > 0 ? results.sort() : ['No Diffs'];
};

const diffFunction: (beforeLines: string[], afterLines: string[]) => string[] = type === 'BY_NUMBER' ? getDiffByNumber : getDiffByContent;
const results: string[] = diffFunction(lineV1s, lineV2s);

// console.log('diffs');
results.forEach(result => {
    console.log(result);
});
