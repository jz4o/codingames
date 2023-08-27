/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const words: string[] = [];
for (let i = 0; i < N; i++) {
    const word: string = readline();
    words.push(word);
}
const results: string[] = [];
for (let i = 0; i < N; i++) {

    // Write an answer using console.log()
    // To debug: console.error('Debug messages...');

    const word: string = words[i];

    const prefixLength: number = [...Array(word.length).keys()].find(length => {
        const prefix: string = word.slice(0, length);

        return words.filter(w => w.startsWith(prefix)).length === 1;
    }) || word.length;

    const result: string = word.slice(0, prefixLength);

    // console.log('<word_prefix>');
    results.push(result);
}

results.forEach(result => {
    console.log(result);
});
