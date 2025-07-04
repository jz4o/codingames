/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const ls: string[] = [];
for (let i = 0; i < N; i++) {
    const L: string = readline();
    ls.push(L);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const transpose: <T>(array: T[][]) => T[][] = <T>(array: T[][]): T[][] => {
    return array[0].map((_value, index) => array.map(row => row[index]));
};

const zip: <T, U>(a: T[], b: U[]) => [T, U][] = <T, U>(a: T[], b: U[]): [T, U][] => {
    const arraySize: number = Math.max(a.length, b.length);
    return [...Array(arraySize).keys()].map(index => {
        return [a[index], b[index]];
    });
};

const functions: { [key: string]: (note: string[][][]) => string[][][] } = {
    rtl: (note: string[][][]) => {
        const halfSize: number = Math.floor(note[0].length / 2);

        return note.map(noteRow => {
            const front = noteRow.slice(0, halfSize);
            const back = noteRow.slice(halfSize);

            return zip(back.reverse(), front).map(([b, f]) => [...b.reverse(), ...f].flat());
        });
    },
    btt: (note: string[][][]) => {
        return transpose(functions.rtl(transpose(note)));
    },
    ltr: (note: string[][][]) => {
        return functions.rtl(note.map(noteRow => noteRow.reverse())).map(noteRow => noteRow.reverse());
    },
    ttb: (note: string[][][]) => {
        return functions.btt(note.reverse()).reverse();
    }
};
const functionNames: string[] = ['rtl', 'btt', 'ltr', 'ttb'];

let foldingNote: string[][][] = ls.map(l => l.split('').map(c => [c]));
[...Array((N**2).toString(2).length - 1).keys()].forEach(index => {
    const functionName: string = functionNames[index % functionNames.length];

    foldingNote = functions[functionName](foldingNote);
});

const result: string = foldingNote.flat(Infinity).join('');

// console.log('decoded note');
console.log(result);

