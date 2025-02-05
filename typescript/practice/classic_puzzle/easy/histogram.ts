/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const S: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const zip: <T, U>(a: T[], b: U[]) => [T, U][] = <T, U>(a: T[], b: U[]): [T, U][] => {
    const arraySize: number = Math.max(a.length, b.length);
    return [...Array(arraySize).keys()].map(index => {
        return [a[index], b[index]];
    });
};

const ALPHABETS: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

const letters: string[] = S.toUpperCase().replace(new RegExp(`[^${ALPHABETS}]`, 'g'), '').split('');

const DECIMALS_DIGITS: number = 2;

const alphabetRows: string[] = ALPHABETS.split('').map(alphabet => {
    const count: number = letters.filter(letter => letter === alphabet).length;
    const percentage: number = count/ letters.length * 100;
    const formattedPercentage: string = percentage.toFixed(DECIMALS_DIGITS);

    const space: string = ' '.repeat(Math.round(percentage));

    const alphabetRow: string = `${alphabet} |${space}|${formattedPercentage}%`.replace('||', '|');

    return alphabetRow;
});

const firstPipeIndex: number = 2;
const barRows: string[] = [...Array(ALPHABETS.length + 1).keys()].map(index => {
    const aboveLastPipeIndex: number = index > 0 ? alphabetRows[index - 1].lastIndexOf('|') : firstPipeIndex;
    const belowLastPipeIndex: number = index < ALPHABETS.length ? alphabetRows[index].lastIndexOf('|') : firstPipeIndex;

    const lastPipeIndex: number = Math.max(aboveLastPipeIndex, belowLastPipeIndex);

    const row: string[] = Array(lastPipeIndex).fill(' ');

    const hyphenSize: number = lastPipeIndex - firstPipeIndex;
    row.splice(firstPipeIndex, hyphenSize, ...Array(hyphenSize).fill('-'));

    row[firstPipeIndex] = '+';
    row[aboveLastPipeIndex] = '+';
    row[belowLastPipeIndex] = '+';

    return row.join('');
});

const results: string[] = zip(barRows, alphabetRows).flat().filter(result => result);

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
