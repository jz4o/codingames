/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline(), 10);
const lineRows: string[] = [];
for (let i = 0; i < N; i++) {
    const line: string = readline();
    lineRows.push(line);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const results: string[] = lineRows.map(lineRow => {
    if (!lineRow.replace(/".*?"|\./g, '').split(' ').includes('Hagrid')) {
        return lineRow;
    }

    return lineRow.replace(/".*?"/, match => {
        const line = match;

        const convertedLineWords: string[] = line.match(/["()!?,.\s]|[^"()!?,.\s]+/g).map(word => {
            if (word.includes("'") || word.includes('-')) {
                return word;
            }

            const convertWords: { [key: string]: string } = {
                you: 'yeh',
                to: 'ter',
                and: "an'",
                me: 'meh',
            };
            const key: string = word.toLowerCase();
            if (key in convertWords) {
                const caseFunctions: ((char: string) => string)[] = word.split('').map(c => {
                    return c === c.toLowerCase() ? c => c.toLowerCase() : c => c.toUpperCase();
                });

                const convertedWord: string = convertWords[key];
                const convertedChars: string[] = convertedWord.split('').map((c, i) => {
                    const caseFunction: (char: string) => string = caseFunctions[i] || caseFunctions.at(-1);

                    return caseFunction(c);
                });

                return convertedChars.join('');
            } else if (word.length >= 3) {
                const chars: string[] = word.split('');
                if (chars.at(0).toLowerCase() === 'h') {
                    chars[0] = "'";
                }
                if ('ftdg'.includes(word.at(-1).toLowerCase())) {
                    chars[chars.length - 1] = "'";
                }

                return chars.join('');
            } else {
                return word;
            }
        });

        return convertedLineWords.join('');
    });
});

// console.log('Yeh mus\' find a way ter transform these lines');
results.forEach(result => {
    console.log(result);
});
