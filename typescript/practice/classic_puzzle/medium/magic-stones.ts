/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const inputs: string[] = readline().split(' ');
let stones: number[] = [];
for (let i = 0; i < N; i++) {
    const level: number = parseInt(inputs[i]);

    stones.push(level);
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const levels: number[] = stones.reduce((levels, stone) => {
    if (!levels.includes(stone)) {
        levels.push(stone);
    }

    return levels;
}, []).sort();

let stoneCount: number = 0;
while (levels.length > 0) {
    const level: number = levels.shift();
    const targetLevelStones: number[] = stones.filter(stone => stone === level);
    const nextLevelStoneCount: number = Math.trunc(targetLevelStones.length / 2);
    const targetStoneCount: number = targetLevelStones.length % 2;
    stones = stones.filter(stone => stone !== level);

    if (nextLevelStoneCount > 0) {
        const nextLevel: number = level + 1;
        stones.push(...Array(nextLevelStoneCount).fill(nextLevel));
        levels.unshift(nextLevel);
    }

    stoneCount += targetStoneCount;
}

// console.log('1');
console.log(stoneCount);

