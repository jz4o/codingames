/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

interface FigthResult {
    winner: string;
    index: number;
}

const CARD_LANKS: string[] = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'];

const n: number = parseInt(readline()); // the number of cards for player 1
const deck1: number[] = [];
for (let i = 0; i < n; i++) {
    const cardp1: string = readline(); // the n cards of player 1

    const cardLank: string = cardp1.slice(0, cardp1.length - 1).toString();
    deck1.push(CARD_LANKS.indexOf(cardLank));
}
const m: number = parseInt(readline()); // the number of cards for player 2
const deck2: number[] = [];
for (let i = 0; i < m; i++) {
    const cardp2: string = readline(); // the m cards of player 2

    const cardLank: string = cardp2.slice(0, cardp2.length - 1).toString();
    deck2.push(CARD_LANKS.indexOf(cardLank));
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const fight = (deck1: number[], deck2: number[], index: number = 0): FigthResult => {
    const deck1Card: number = deck1[index];
    const deck2Card: number = deck2[index];

    if (deck1Card === undefined || deck2Card === undefined) {
        throw new Error;
    }

    if (deck1Card === deck2Card) {
        return fight(deck1, deck2, index + 4);
    }

    return {
        winner: deck1Card < deck2Card ? 'deck2' : 'deck1',
        index: index
    };
};

let result: string;
try {
    let turn: number = 0;
    while (deck1.length > 0 && deck2.length > 0) {
        turn++;

        const fightResult: FigthResult = fight(deck1, deck2);
        const moveCards: number[] = [...deck1.splice(0, fightResult.index + 1), ...deck2.splice(0, fightResult.index + 1)];
        const winnerDeck: number[] = fightResult.winner === 'deck1' ? deck1 : deck2;
        winnerDeck.push(...moveCards);
    }

    result = `${deck1.length > 0 ? 1 : 2} ${turn}`;
} catch (_) {
    result = 'PAT';
}

// console.log('PAT');
console.log(result);
