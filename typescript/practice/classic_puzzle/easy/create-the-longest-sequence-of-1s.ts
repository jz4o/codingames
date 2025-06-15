/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const b: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type ChunkedBit = {
    bit: string,
    size: number
};

const chunkedBits: ChunkedBit[] = [];
b.split('').forEach(c => {
    if (chunkedBits.length === 0 || chunkedBits[chunkedBits.length - 1].bit !== c) {
        chunkedBits.push({ bit: c, size: 1 });
    } else {
        chunkedBits[chunkedBits.length -1].size++;
    }
});

const sequences: number[] = [];
if (chunkedBits.length === 1) {
    // all bits is equal
    const [chunkedBit]: ChunkedBit[] = chunkedBits;
    sequences.push(chunkedBit.bit === '1' ? chunkedBit.size - 1 : 1);
} else {
    // extend a positive
    sequences.push(...chunkedBits.filter(chunk => chunk.bit === '1').map(chunk => chunk.size + 1));

    // connect two positive
    [...Array(chunkedBits.length - 2).keys()].forEach(i => {
        const previousChunk: ChunkedBit = chunkedBits[i];
        const currentChunk: ChunkedBit = chunkedBits[i + 1];
        const nextChunk: ChunkedBit = chunkedBits[i + 2];

        if (currentChunk.bit !== '0') {
            return;
        }

        if (currentChunk.size !== 1) {
            return;
        }

        sequences.push(previousChunk.size + currentChunk.size + nextChunk.size);
    });
}

const result: number = sequences.reduce((max, sequence) => Math.max(max, sequence), 0);

// console.log('answer');
console.log(result);

