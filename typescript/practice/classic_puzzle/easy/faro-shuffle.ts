/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const deck: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const faroShuffle = (deck: string): string => {
    const splitedDeck: string[] = deck.split(' ');

    const halfIndex: number = Math.ceil(splitedDeck.length / 2);
    const frontHalf: string[] = splitedDeck.slice(0, halfIndex);
    const backHalf: string[] = splitedDeck.slice(halfIndex);
    if (splitedDeck.length % 2 == 1) {
        backHalf.push('');
    }

    const result: string = [...Array(frontHalf.length).keys()].flatMap(i => {
        return [
            frontHalf[i] !== '' ? frontHalf[i] : null,
            backHalf[i] !== '' ? backHalf[i] : null
        ];
    })
    .filter(r => r)
    .join(' ');

    return result;
};

const result: string = [...Array(n)].reduce(faroShuffle, deck);

// console.log('answer');
console.log(result);
