/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const b: number = parseInt(readline());
const titles: string[] = [];
for (let i = 0; i < b; i++) {
    const title: string = readline();
    titles.push(title);
}
const n: number = parseInt(readline());
const names: string[] = [];
for (let i = 0; i < n; i++) {
    const name: string = readline();
    names.push(name);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Bookshelf {
    bookNames: string[];
    size: number;

    constructor(size: number) {
        this.bookNames = [];
        this.size = size;
    }

    addBooks: (bookNames: string[], force?: boolean) => string[] = (bookNames: string[], force: boolean = false): string[] => {
        const addBookNames: string[] = bookNames.filter(bookName => !this.bookNames.includes(bookName));
        if (!force && this.size < this.bookNames.length + addBookNames.length) {
            return [];
        }

        this.bookNames.push(...addBookNames);

        return this.bookNames;
    };

    books: () => string[] = (): string[] => {
        return this.bookNames.sort();
    };

    isUnderControl: () => boolean = (): boolean => {
        return this.bookNames.length <= this.size;
    };
}

const getRankBookNames: (books: string[], rank: string) => string[] = (books: string[], rank: string): string[] => {
    return books
        .filter(book => book.endsWith(` ${rank}`))
        .map(book => book.replace(new RegExp(String.raw`\s${rank}$`), ''));
};

const rankedBookNames: string[][] = [...Array(10).keys()]
    .reverse()
    .map(rank => getRankBookNames(names, rank.toString()))
    .filter(rankBookNames => rankBookNames.length > 0);

const bookshelf: Bookshelf = new Bookshelf(n);

bookshelf.addBooks(titles, true);
bookshelf.addBooks(getRankBookNames(names, 'None'), true);
if (rankedBookNames.length > 0) {
    bookshelf.addBooks(rankedBookNames.shift(), true);
}
while (rankedBookNames.length > 0 && bookshelf.addBooks(rankedBookNames.shift()).length > 0) {
    // nothing to do
}

const results: string[] = bookshelf.isUnderControl() ? bookshelf.books() : ['Your TBR is out of control Clara!'];

// console.log('Your TBR is out of control Clara!');
results.forEach(result => {
    console.log(result);
});
