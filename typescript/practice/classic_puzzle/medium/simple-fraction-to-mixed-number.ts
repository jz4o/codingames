/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const gcd = (x: number, y: number): number => {
    let tmp: number;
    while ((tmp = x % y) !== 0) {
        x = y;
        y = tmp;
    }

    return y;
};

const N: number = parseInt(readline());
const xys: string[] = [];
for (let i = 0; i < N; i++) {
    const xY: string = readline();

    xys.push(xY);
}
for (let i = 0; i < N; i++) {

    // Write an action using console.log()
    // To debug: console.error('Debug messages...');

    const xy: string = xys[i];
    const [x, y]: number[] = xy.split('/').map(i => parseInt(i));

    if (y === 0) {
        console.log('DIVISION BY ZERO');
        continue;
    }

    const int: number = Math.trunc(x / y);
    const intStr: string = int !== 0 ? int.toString() : '';

    const rat: number = x % y;
    const gcdNum: number = gcd(rat, y);
    const ratX: number = Math.trunc(rat / gcdNum);
    const ratY: number = Math.trunc(y / gcdNum);
    const minus: string = [int, ratX, ratY].filter(b => b < 0).length % 2 === 1 ? '-' : '';
    const ratStr: string = rat !== 0 ? `${minus}${Math.abs(ratX)}/${Math.abs(ratY)}` : '';

    const result: string = `${intStr} ${ratStr}`.trim();

    // console.log('answer');
    console.log(result || '0');
}
