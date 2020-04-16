/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

var inputs: string[] = readline().split(' ');
const W: number = parseInt(inputs[0]);
const H: number = parseInt(inputs[1]);
const map: number[][] = [];
for (let i = 0; i < H; i++) {
    map.push([]);

    var inputs: string[] = readline().split(' ');
    for (let j = 0; j < W; j++) {
        const food: number = parseInt(inputs[j]);

        map[i].push(food);
    }
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

for (let height = 0; height < H; height++) {
    for (let width = 0; width < W; width++) {
        const top: number = height === 0 ? 0 : map[height - 1][width];
        const left: number = width === 0 ? 0 : map[height][width - 1];

        map[height][width] += Math.max(top, left);
    }
}

// console.log('answer');
console.log(map[H - 1][W - 1]);
