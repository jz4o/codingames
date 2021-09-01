/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const transactions: string[] = [];
for (let i = 0; i < N; i++) {
    const transaction: string = readline();

    transactions.push(transaction);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const benfordLawPercentages: number[] = [0, 0.301, 0.176, 0.125, 0.097, 0.079, 0.067, 0.058, 0.051, 0.046];
const firstNumbers: number[] = transactions.map(transaction => Number(transaction.match(/[1-9]/)[0]));

const isFraudulent: boolean = [...Array(9).keys()].map(k => k + 1).some(i => {
    const benfordLawPercentage: number = Number(benfordLawPercentages[i]);
    const percent: number = firstNumbers.filter(n => n === i).length / N;

    return !((benfordLawPercentage - 0.1) <= percent && percent <= (benfordLawPercentage + 0.1));
});

// console.log('false');
console.log(isFraudulent);
