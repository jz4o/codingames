/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const mode: string = readline();
const n: number = parseInt(readline(), 10);
const playerRows: string[][] = [];
for (let i = 0; i < n; i++) {
    const inputs: string[] = readline().split(' ');
    const [name, hand]: string[] = inputs;
    playerRows.push([name, hand]);
}
const d: number = parseInt(readline(), 10);
const dicts: string[] = [];
for (let i = 0; i < d; i++) {
    const dict: string = readline();
    dicts.push(dict);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

interface PlayerResult {
    name: string;
    score: number;
    word: string;
}

const letterScoring: { [key: string]: number } = {};
['a', 'e', 'i', 'l', 'n', 'o', 'r', 's', 't', 'u'].forEach(l => letterScoring[l] = 1);
['g', 'd'].forEach(l => letterScoring[l] = 2);
['b', 'c', 'm', 'p'].forEach(l => letterScoring[l] = 3);
['f', 'h', 'v', 'w', 'y'].forEach(l => letterScoring[l] = 4);
['k'].forEach(l => letterScoring[l] = 5);
['j', 'x'].forEach(l => letterScoring[l] = 8);
['q', 'z'].forEach(l => letterScoring[l] = 10);

const convertSortedWordToOriginWords: { [key: string]: string } = {};
dicts.sort().reverse().forEach(word => convertSortedWordToOriginWords[word.split('').sort().join('')] = word);

const playerResults: PlayerResult[] = playerRows.flatMap(([name, hand]) => {
    const sortedHand: string = hand.split('').sort().join('');
    if (!(sortedHand in convertSortedWordToOriginWords)) {
        return [];
    }

    const word: string = convertSortedWordToOriginWords[sortedHand];
    const score: number = word.split('').reduce((sum, l) => sum + letterScoring[l], 0);

    return { name, score, word };
});

const scores: number[] = playerResults.map(playerResult => playerResult.score);
const winScore: number = mode === 'high' ? Math.max(...scores) : Math.min(...scores);

const results: string[] = playerResults.flatMap(playerResult => {
    if (playerResult.score !== winScore) {
        return [];
    }

    return `${playerResult.name} ${playerResult.word}`;
});

// console.log('winner_name winner_word');
results.forEach(result => {
    console.log(result);
});
