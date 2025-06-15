/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const as: string[] = [];
for (let i = 0; i < n; i++) {
    const a: string = readline();
    as.push(a);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Hand = {
    beats: string,
    losesTo: string
};

type PlayResult = {
    hand: string,
    winCount: number,
    startIndex: number
};

const RULE: { [key: string]: Hand } = {
    'Rock': {
        beats: 'Scissors',
        losesTo: 'Paper'
    },
    'Scissors': {
        beats: 'Paper',
        losesTo: 'Rock'
    },
    'Paper': {
        beats: 'Rock',
        losesTo: 'Scissors'
    }
};

const doubleAs: string[] = [...as, ...as];
const playResults: PlayResult[] = as.map((a, index) => {
    const hand: string = RULE[a].losesTo;

    const targetAs: string[] = doubleAs.slice(index, index + n);
    const loseIndex: number = targetAs.indexOf(RULE[hand].losesTo);

    const winCount: number = targetAs.slice(0, loseIndex).filter(a => a === RULE[hand].beats).length;

    return {
        hand,
        winCount,
        startIndex: index
    };
});

const [playResult]: PlayResult[] = playResults.sort((a, b) => {
    if (a.winCount !== b.winCount) {
        return b.winCount - a.winCount;
    }

    return a.startIndex - b.startIndex;
});

const results: string[] = [
    playResult.hand,
    playResult.startIndex.toString()
];

// console.log('Rock');
// console.log('4');
results.forEach(result => {
    console.log(result);
});

