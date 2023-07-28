/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const lines: string[] = [];
for (let i = 0; i < N; i++) {
    const line: string = readline();
    lines.push(line);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Stack = {
    upperMost: number;
};

const results: number[] = lines.map(line => {
    let stacks: Stack[] = [];

    line.split('').map(c => c.charCodeAt(0)).forEach(container => {
        stacks = stacks.sort((a, b) => a.upperMost - b.upperMost);

        const putableIndex = stacks.findIndex(stack => container <= stack.upperMost);
        if (putableIndex >= 0) {
            stacks[putableIndex].upperMost = container;
        } else {
            stacks.push({ upperMost: container });
        }
    });

    return stacks.length;
});

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
