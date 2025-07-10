/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const INPUT: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo: (from: number, to: number) => number[] = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
};

const eachSlice: <T>(array: T[], n: number) => T[][] = <T>(array: T[], n: number): T[][] => {
    return [...Array(Math.ceil(array.length / n)).keys()].map(i => array.slice(i * n, i * n + n));
};

const toArray: (str: string) => number[] = (str: string): number[] => {
    if (/\{.*\}/.test(str)) {
        return str.slice(1, -1).split(';').map(d => parseInt(d));
    } else if (/(?:\[|\]).*(?:\[|\])/.test(str)) {
        const bracketRegexp: RegExp = /(?<beginBracket>\[|\])(?<beginNum>[-\d]+);(?<endNum>[-\d]+)(?<endBracket>\[|\])/;
        const { beginBracket, beginNum: beginNumStr, endNum: endNumStr, endBracket } = str.match(bracketRegexp).groups;
        const beginNum: number = parseInt(beginNumStr) + (beginBracket === ']' ? 1 : 0);
        const endNum: number = parseInt(endNumStr) - (endBracket === '[' ? 1 : 0);

        return rangeArrayFromTo(beginNum, endNum);
    } else {
        return [];
    }
};

const expansion: (str: string) => number[] = (str: string): number[] => {
    const strElements: string[] = str.split(/(?<operation>I|U|-(?!\d))/);
    return eachSlice(strElements.slice(1), 2).reduce((resultArray, [operation, arrayStr]) => {
        const array: number[] = toArray(arrayStr);
        switch (operation) {
            case 'U': return [...new Set([...resultArray, ...array])];
            case 'I': return resultArray.filter(r => array.includes(r));
            case '-': return resultArray.filter(r => !array.includes(r));
            default: return [];
        }
    }, toArray(strElements[0]));
};

const toBraces: (nums: number[]) => string = (nums: number[]): string => {
    return `{${nums.join(';')}}`;
};

let tempInput: string = INPUT.toString();
while (/\(.*?\)/.test(tempInput)) {
    const { parenthese }: { [key: string]: string } = tempInput.match(/(?<parenthese>\([^(]*?\))/).groups;
    const expansionedParenthese = toBraces(expansion(parenthese.slice(1, -1)));

    while (tempInput.includes(parenthese)) {
        tempInput = tempInput.replace(parenthese, expansionedParenthese);
    }
}

const resultArray: number[] = expansion(tempInput);

const result: string = resultArray.length === 0 ? 'EMPTY' : resultArray.sort((a, b) => a - b).join(' ');

// console.log('answer');
console.log(result);

