/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const original: string = readline();
const words: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class ReorderingSentence {
    remainSentence: string;
    orderWords: string[];
    reorderedWords: string[];

    constructor(sentence: string, words: string[]) {
        this.remainSentence = sentence;
        this.orderWords = words;
        this.reorderedWords = [];
    }

    getCandidateNextWords: () => string[] = (): string[] => {
        const nextWords: string[] = this.orderWords.filter(word => this.remainSentence.startsWith(word));

        return [...new Set(nextWords)];
    };

    getReorderedSentence: () => string = (): string => {
        return this.reorderedWords.join(' ');
    };

    isReordered: () => boolean = (): boolean => {
        return this.orderWords.length === 0;
    };

    decideNextWord: (word: string) => void = (word: string): void => {
        this.remainSentence = this.remainSentence.replace(new RegExp(`^${word}`), '');

        this.orderWords.splice(this.orderWords.indexOf(word), 1);
        this.reorderedWords.push(word);
    };

    clone: () => ReorderingSentence = (): ReorderingSentence => {
        const clonedRemainSentence: string = this.remainSentence.toString();
        const clonedOrderWords: string[] = [...this.orderWords];
        const clonedReorderedWords: string[] = [...this.reorderedWords];

        const clonedReorderingSentence: ReorderingSentence = new ReorderingSentence(clonedRemainSentence, clonedOrderWords);
        clonedReorderingSentence.reorderedWords = clonedReorderedWords;

        return clonedReorderingSentence;
    };
}

const reorderingSentences: ReorderingSentence[] = [new ReorderingSentence(original, words.split(' '))];
const reorderedSentences: string[] = [];
while (reorderingSentences.length > 0) {
    const reorderingSentence = reorderingSentences.pop();

    if (reorderingSentence.isReordered()) {
        reorderedSentences.push(reorderingSentence.getReorderedSentence());
        continue;
    }
    if (reorderedSentences.length > 1) {
        break;
    }

    const candidateNextWords: string[] = reorderingSentence.getCandidateNextWords();
    if (candidateNextWords.length === 0) {
        continue;
    }

    candidateNextWords.slice(1).forEach(candidateNextWord => {
        const newReorderingSentence: ReorderingSentence = reorderingSentence.clone();
        newReorderingSentence.decideNextWord(candidateNextWord);

        reorderingSentences.push(newReorderingSentence);
    });

    reorderingSentence.decideNextWord(candidateNextWords[0]);
    reorderingSentences.unshift(reorderingSentence);
}

const result: string = reorderedSentences.length === 1 ? reorderedSentences[0] : 'Unsolvable';

// console.log('original sentence with spaces');
console.log(result);

