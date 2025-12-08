/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const n: number = parseInt(inputs[0]);
const _m: number = parseInt(inputs[1]);
const lines: string[] = [];
for (let i = 0; i < n; i++) {
    const line: string = readline();
    lines.push(line);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const uniq: <T>(array: T[]) => T[] = <T>(array: T[]): T[] => {
    return Array.from(new Set(array));
};

const splitCons: (str: string, n: number) => string[] = (str: string, n: number): string[] => {
    return [...Array(str.length - n + 1).keys()].map(i => str.slice(i, i + n));
};

const isReplaceable: (str: string) => boolean = (str: string): boolean => {
    const charGroups: string[] = uniq(splitCons(str, 2));

    return charGroups.some(charGroup => {
        return str.match(new RegExp(charGroup, 'g')).length >= 2;
    });
};

let replacedString: string = lines.join('');
const replaceArray: string[] = [];

let replaceChar: string = 'Z';

while (isReplaceable(replacedString)) {
    const charGroups: string[] = uniq(splitCons(replacedString, 2));
    const groupSizes: [string, number][] = charGroups.map(charGroup => {
        const charGroupSize: number = replacedString.match(new RegExp(charGroup, 'g')).length;

        return [charGroup, charGroupSize];
    });

    const maxGroupSize: number = Math.max(...groupSizes.map(([_, groupSize]) => groupSize));
    const [targetChar, _]: [string, number] = groupSizes.find(([_, groupSize]) => groupSize === maxGroupSize);

    replacedString = replacedString.replace(new RegExp(targetChar, 'g'), replaceChar);
    replaceArray.push(`${replaceChar} = ${targetChar}`);

    replaceChar = String.fromCharCode(replaceChar.charCodeAt(0) - 1);
}

const results: string[] = [replacedString, ...replaceArray];

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
