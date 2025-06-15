/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs1: string[] = readline().split(' ');
const N: number = parseInt(inputs1[0]);
const T: number = parseInt(inputs1[1]);
const cs: number[] = [];
for (let i = 0; i < T; i++) {
    const inputs2: string[] = readline().split(' ');
    for (let j = 0; j < N; j++) {
        const C: number = parseInt(inputs2[j]);
        cs.push(C);
    }
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const eachSlice: <T>(array: T[], n: number) => T[][] = <T>(array: T[], n: number): T[][] => {
    return [...Array(Math.ceil(array.length / n)).keys()].map(i => array.slice(i * n, i * n + n));
};

const oddNumbers: string[] = rangeArrayFromTo(1, N * 2, 2).map(i => i.toString());
const evenNumbers: string[] = rangeArrayFromTo(2, N * 2, 2).map(i => i.toString());

const guessObject: { [key: string]: string[] } = {};
rangeArrayFromTo(1, N * 2).forEach(i => {
    guessObject[i.toString()] = i % 2 === 0 ? oddNumbers : evenNumbers;
});

eachSlice(cs, N).forEach(coinPair => {
    coinPair.forEach((aNumber, aIndex) => {
        const a: string = aNumber.toString();

        coinPair.slice(aIndex + 1).forEach(bNumber => {
            const b: string = bNumber.toString();

            if ((guessObject[a] || []).includes(b)) {
                guessObject[a] = guessObject[a].filter(i => i !== b);
            }

            if ((guessObject[b] || []).includes(a)) {
                guessObject[b] = guessObject[b].filter(i => i !== a);
            }
        });
    });
});

let pendingKeys: string[] = Object.keys(guessObject);
while (pendingKeys.length > 0) {
    const fixPairs: { [key: string]: string } = {};
    Object.entries(guessObject).forEach(([k, v]) => {
        if (v.length === 1) {
            const [value]: string[] = v;
            fixPairs[k] = value;
        }
    });

    Object.entries(fixPairs).forEach(([k, v]) => {
        guessObject[v] = [k];

        Object.keys(guessObject).filter(i => i !== v).forEach(dk => {
            if ((guessObject[dk] || []).includes(k)) {
                guessObject[dk] = guessObject[dk].filter(i => i !== k);
            }
        });

        Object.keys(guessObject).filter(i => i !== k).forEach(dk => {
            if ((guessObject[dk] || []).includes(v)) {
                guessObject[dk] = guessObject[dk].filter(i => i !== v);
            }
        });
    });

    pendingKeys = pendingKeys.filter(key => !(key in fixPairs));
}

const result: string = oddNumbers.map(i => guessObject[i][0]).join(' ');

// console.log('2 4 6...');
console.log(result);

