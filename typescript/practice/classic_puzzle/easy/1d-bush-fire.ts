/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const lines: string[] = [];
for (let i = 0; i < N; i++) {
    const line: string = readline();
    lines.push(line);
}
for (let i = 0; i < N; i++) {

    // Write an answer using console.log()
    // To debug: console.error('Debug messages...');

    const line: string = lines[i];
    let indexes: number[] = line.split('').map((char, index) => char === 'f' ? index : null).filter(index => index !== null);

    let dropCount: number = 0;
    while (indexes.length > 0) {
        const index: number = indexes.shift();

        dropCount++;

        indexes = indexes.filter(j => index + 2 < j);
    }

    const result: string = dropCount.toString();

    // console.log('answer');
    console.log(result);
}
