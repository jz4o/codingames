/**
 * Don't let the machines win. You are humanity's last hope...
 **/

const width: number = parseInt(readline()); // the number of cells on the X axis
const height: number = parseInt(readline()); // the number of cells on the Y axis
const grid: string[][] = [];
for (let i = 0; i < height; i++) {
    const line: string = readline(); // width characters, each either 0 or .

    grid.push(line.split(''));
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
}

const results: string[] = [];
rangeArrayFromTo(0, height - 1).forEach(h => {
    rangeArrayFromTo(0, width - 1).forEach(w => {
        if (grid[h][w] === '.') {
            return;
        }

        const currentNode: string = `${w} ${h}`;

        const rightIndex: number = rangeArrayFromTo(w + 1, width - 1).find(r => {
            return grid[h][r] === '0';
        });
        const rightNode: string = rightIndex ? `${rightIndex} ${h}` : '-1 -1';

        const bottomIndex: number = rangeArrayFromTo(h + 1, height - 1).find(b => {
            return grid[b][w] === '0';
        });
        const bottomNode: string = bottomIndex ? `${w} ${bottomIndex}` : '-1 -1';

        results.push([currentNode, rightNode, bottomNode].join(' '));
    });
});

// Three coordinates: a node, its right neighbor, its bottom neighbor
// console.log('0 0 1 0 0 1');
results.forEach(result => {
    console.log(result);
});
