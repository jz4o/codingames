/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const C: number = parseInt(readline());
const budgets: number[] = [];
for (let i = 0; i < N; i++) {
    const B: number = parseInt(readline());

    budgets.push(B);
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const budgetsSum: number = budgets.reduce((sum, budget) => sum + budget, 0);

const results: string[] = [];
if (budgetsSum < C) {
    results.push('IMPOSSIBLE');
} else {
    budgets.sort((a, b) => a - b ); // ascending

    let lack: number = C;
    while (budgets.length > 0) {
        const average: number = Math.floor(lack / budgets.length);
        const pay: number = Math.min(budgets.shift(), average);
        lack -= pay;

        results.push(pay.toString());
    }
}

// console.log('IMPOSSIBLE');
results.forEach(result => {
    console.log(result)
});
