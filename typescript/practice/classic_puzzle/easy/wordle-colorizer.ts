/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const answer: string = readline();
const N: number = parseInt(readline());
const attempts: string[] = [];
for (let i = 0; i < N; i++) {
    const attempt: string = readline();
    attempts.push(attempt);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const results: string[] = attempts.map(attempt => {
    const answerChars: string[] = answer.split('');
    const attemptChars: string[] = attempt.split('');

    const rightIndexes: number[] = attemptChars.map((char, index) => answerChars[index] === char ? index : null).filter(index => index !== null);
    rightIndexes.reverse().forEach(index => answerChars.splice(index, 1));

    const resultChars: string[] = attemptChars.map((attemptChar, index) => {
        if (rightIndexes.includes(index)) {
            return '#';
        } else if (answerChars.includes(attemptChar)) {
            answerChars.splice(answerChars.indexOf(attemptChar), 1);
            return 'O';
        } else {
            return 'X';
        }
    });

    return resultChars.join('');
});

// console.log('OXOXO');
results.forEach(result => {
    console.log(result);
});
