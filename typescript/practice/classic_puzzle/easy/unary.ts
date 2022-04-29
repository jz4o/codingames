/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const MESSAGE: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const binaries: number[] = MESSAGE.split('').reduce((binaries, char) => {
    const binary: string = char.codePointAt(0).toString(2);
    const sevenBitBinary: string = `0000000${binary}`.slice(-7);
    const sevenBitBinaryNumberArray: number[] = sevenBitBinary.split('').map(i => parseInt(i));

    binaries.push(...sevenBitBinaryNumberArray);

    return binaries;
}, []);

const groupedBinaries: number[][] = []
while (binaries.length > 0) {
    const firstBinary: number = binaries[0];
    const searchTargetBinary: number = firstBinary * -1 + 1;

    const targetBinaryIndex: number = binaries.indexOf(searchTargetBinary);
    const deleteSize: number = targetBinaryIndex < 0 ? binaries.length : targetBinaryIndex;

    const deleteBinaries: number[] = binaries.splice(0, deleteSize);

    groupedBinaries.push(deleteBinaries);
}

const result: string[] = [];
groupedBinaries.forEach(groupedBinary => {
    result.push('0'.repeat(2 - groupedBinary[0]));
    result.push('0'.repeat(groupedBinary.length));
});

// console.log('answer');
console.log(result.join(' '));
