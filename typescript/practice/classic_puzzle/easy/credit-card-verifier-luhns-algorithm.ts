/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const cards: string[] = [];
for (let i = 0; i < n; i++) {
    const card: string = readline();
    cards.push(card);
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const results: string[] = [];
for (const card of cards) {
    const sum: number = card.replace(/ /g, '')
                            .split('')
                            .map((d, index) => {
                                let result: number = parseInt(d)
                                if (index % 2 === 0) {
                                    result *= 2;
                                    if (result >= 10) {
                                        result -= 9;
                                    }
                                }

                                return result;
                            })
                            .reduce((sum, d) => sum + d, 0);

    results.push(sum % 10 === 0 ? 'YES' : 'NO');
}

// console.log('YES or NO');
for (const result of results) {
    console.log(result);
}
