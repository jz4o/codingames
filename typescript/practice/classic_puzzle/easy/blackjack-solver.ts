/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const bankCards: string = readline();
const playerCards: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Hand {
    cardPoints: number[];
    point: number;

    constructor(cards: string[]) {
        const cardPoints: number[] = cards.map(card => {
            if ('JQK'.includes(card)) {
                return 10;
            } else if (card === 'A') {
                return 1;
            } else {
                return parseInt(card);
            }
        });

        let point: number = cardPoints.reduce((sum, cardPoint) => sum + cardPoint, 0);
        if (cardPoints.includes(1) && point <= 11) {
            point += 10;
        }
        if (point > 21) {
            point = 0
        }

        this.cardPoints = cardPoints;
        this.point = point;
    }

    isBurst: () => boolean = (): boolean => {
        return this.point === 0
    };

    isBlackJack: () => boolean = (): boolean => {
        return this.cardPoints.sort().join(' ') === [1, 10].join(' ');
    };
}

const bankHand: Hand = new Hand(bankCards.split(' '));
const playerHand: Hand = new Hand(playerCards.split(' '));

let result: string;
if (playerHand.isBlackJack() && !bankHand.isBlackJack()) {
    result = 'Blackjack!';
} else if (playerHand.point < bankHand.point || (bankHand.isBurst() && playerHand.isBurst())) {
    result = 'Bank';
} else if (bankHand.point < playerHand.point) {
    result = 'Player';
} else {
    result = 'Draw';
}

// console.log('Blackjack!');
console.log(result);
