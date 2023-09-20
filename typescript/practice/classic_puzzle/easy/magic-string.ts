/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const ss: string[] = [];
for (let i = 0; i < N; i++) {
    const S: string = readline();
    ss.push(S);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const intToAlpha: (num: number) => string = (num: number): string => {
    const ALPHABETS: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    let result: string = '';
    let i: number = num;
    while (i > 0) {
        let mod: number = i % ALPHABETS.length;
        i = Math.floor(i / ALPHABETS.length);
        if (mod === 0) {
            i--;
            mod = ALPHABETS.length;
        }

        result = `${ALPHABETS[mod - 1]}${result}`;
    }

    return result;
};

const alphaToInt: (alpha: string) => number = (alpha: string): number => {
    const ALPHABETS: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    const result: number = alpha
        .split('')
        .reverse()
        .map((alp, index) => Math.pow(ALPHABETS.length, index) * (ALPHABETS.indexOf(alp) + 1))
        .reduce((sum, i) => sum + i);

    return result;
};

const nextString: (s: string) => string = (s: string): string => {
    return intToAlpha(alphaToInt(s) + 1);
};

ss.sort();

const borderIndex: number = Math.floor(N / 2);
const borderPrev: string = ss[borderIndex - 1];
const borderNext: string = ss[borderIndex];

let border: string = '';
const chars: string[] = borderPrev.split('');

chars.some(char => {
    const borderChar: string = `${border}${char}`;
    const borderCharNext: string = nextString(borderChar);

    if (borderPrev <= borderChar && borderChar < borderNext) {
        border += char;
        return true;
    } else if (borderPrev <= borderCharNext && borderCharNext < borderNext) {
        border += nextString(char);
        return true;
    } else {
        border += char;
    }
});

const result: string = border;

// console.log('answer');
console.log(result);
