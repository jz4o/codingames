/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const m: number = parseInt(readline());
const rs: string[] = [];
for (let i = 0; i < m; i++) {
    const r: string = readline();
    rs.push(r);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const calcNumberOfAddress: (suffix: number) => number = (suffix: number): number => {
    const hostAddressSize: number = 32 - suffix;

    return 2 ** hostAddressSize;
};

const results: string[] = rs.map(r => {
    const [strPrefix, strSuffix]: string[] = r.split('/');
    const suffix: number = parseInt(strSuffix);

    const bits: string = strPrefix.split('.').map(b => parseInt(b).toString(2).padStart(8, '0')).join('');
    const lastOneBitIndex: number = bits.lastIndexOf('1');
    if (lastOneBitIndex < suffix) {
        const numberOfAddress: number = calcNumberOfAddress(suffix);

        return `valid ${numberOfAddress}`;
    } else {
        const newSuffix: number = lastOneBitIndex + 1;
        const numberOfAddress: number = calcNumberOfAddress(newSuffix);

        return `invalid ${strPrefix}/${newSuffix} ${numberOfAddress}`;
    }
});

// console.log('answer');
results.forEach(result => {
    console.log(result);
});

