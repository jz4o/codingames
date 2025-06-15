/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const inputRows: [string, number][] = [];
for (let i = 0; i < n; i++) {
    const [b, cStr]: string[] = readline().split(' ');
    const c: number = parseInt(cStr);

    inputRows.push([b, c]);
}
const s: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type PrefixCode = {
    binary: string,
    char: string
};

const prefixCodes: PrefixCode[] = inputRows
    .map(([b, c]) => { return { binary: b, char: String.fromCharCode(c) }; })
    .sort((a, b) => b.binary.length - a.binary.length);

let tempS: string = s;
let result: string = '';
while (tempS.length > 0) {
    const prefixCode: PrefixCode = prefixCodes.find(prefixCode => tempS.startsWith(prefixCode.binary));
    if (prefixCode === undefined) {
        result = `DECODE FAIL AT INDEX ${s.length - tempS.length}`;
        break;
    }

    tempS = tempS.replace(prefixCode.binary, '');
    result += prefixCode.char;
}

// console.log('abracadabra');
console.log(result);

