/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline()); // Number of elements which make up the association table.
const Q: number = parseInt(readline()); // Number Q of file names to be analyzed.
const extMimes: { [key: string]: string; } = {};
for (let i = 0; i < N; i++) {
    const inputs: string[] = readline().split(' ');
    const EXT: string = inputs[0]; // file extension
    const MT: string = inputs[1]; // MIME type.

    extMimes[EXT.toLowerCase()] = MT;
}
const fnames: string[] = [];
for (let i = 0; i < Q; i++) {
    const FNAME: string = readline(); // One file name per line.

    fnames.push(FNAME.toLowerCase());
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const mimeTypes: string[] = [];
for (const fname of fnames) {
    const fnameElements: string[] = fname.split('.');
    const ext: string = fnameElements.length == 0 ? '' : fnameElements[fnameElements.length - 1];

    const mimeType: string = extMimes[ext];

    if (ext === fname || !mimeType) {
        mimeTypes.push('UNKNOWN');
    } else {
        mimeTypes.push(mimeType);
    }
}

// For each of the Q filenames, display on a line the corresponding MIME type. If there is no corresponding type, then display UNKNOWN.
// console.log('UNKNOWN');
for (const mimeType of mimeTypes) {
    console.log(mimeType);
}

