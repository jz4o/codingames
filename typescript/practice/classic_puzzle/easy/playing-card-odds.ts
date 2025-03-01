/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const R: number = parseInt(inputs[0]);
const S: number = parseInt(inputs[1]);
const removedArray: string[] = [];
for (let i = 0; i < R; i++) {
    const removed: string = readline();
    removedArray.push(removed);
}
const soughtArray: string[] = [];
for (let i = 0; i < S; i++) {
    const sought: string = readline();
    soughtArray.push(sought);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

interface Card {
    rank: string;
    suit: string;
};

const RANKS: string[] = '23456789TJQKA'.split('');
const SUITS: string[] = 'CDHS'.split('');

const isApplicable: (card: Card, condition: string) => boolean = (card: Card, condition: string): boolean => {
    const conditionChars: string[] = condition.split('');
    const conditionRanks: string[] = conditionChars.filter(char => RANKS.includes(char));
    const conditionSuits: string[] = conditionChars.filter(char => SUITS.includes(char));

    const isApplicableRank: boolean = conditionRanks.length === 0 || conditionRanks.includes(card.rank);
    const isApplicableSuit: boolean = conditionSuits.length === 0 || conditionSuits.includes(card.suit);

    return isApplicableRank && isApplicableSuit;
};

const cards: Card[] = RANKS.flatMap(rank => {
    return SUITS.map(suit => ({ rank, suit }));
});

const remainCards: Card[] = cards.filter(card => {
    return removedArray.every(removed => !isApplicable(card, removed));
});

const soughtCards: Card[] = remainCards.filter(card => {
    return soughtArray.some(sought => isApplicable(card, sought));
});

const percentage: number = Math.round(soughtCards.length / remainCards.length * 100);
const result: string = `${percentage}%`;

// console.log('2%');
console.log(result);
