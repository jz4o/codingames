/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const width: number = parseInt(inputs[0]);
const height: number = parseInt(inputs[1]);
const lines: string[] = [];
for (let i = 0; i < height; i++) {
    const line: string = readline();
    lines.push(line);
}
for (let h = 0; h < height; h++) {

    // Write an action using console.log()
    // To debug: console.error('Debug messages...');

    const result: string = [...Array(width).keys()].map(w => {
        const value: string = lines[h].charAt(w);
        if (value === '#') {
            return value;
        }

        const aroundChars: string[] = [];
        if (h !== 0) {
            aroundChars.push(lines[h - 1].charAt(w));
        }
        if (w !== 0) {
            aroundChars.push(lines[h].charAt(w - 1));
        }
        if (w + 1 !== width) {
            aroundChars.push(lines[h].charAt(w + 1));
        }
        if (h + 1 !== height) {
            aroundChars.push(lines[h + 1].charAt(w));
        }

        return aroundChars.filter(c => c === '0').length;
    }).join('');

    // console.log('#####');
    console.log(result);
}
