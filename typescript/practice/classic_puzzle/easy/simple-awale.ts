/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const opBowls: string = readline();
const myBowls: string = readline();
const num: number = parseInt(readline());

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const BOWLS_SIZE:number = 7;
const RESERVE_INDEX: number = BOWLS_SIZE - 1;
const PLAYER_SIZE: number = 2;
const PLAYER_INDEX_OPP: number = 0;
const PLAYER_INDEX_MY: number = 1;

const bowls: number[][] = [];
bowls.push(opBowls.split(' ').map(b => parseInt(b)));
bowls.push(myBowls.split(' ').map(b => parseInt(b)));

let seeds: number = bowls[PLAYER_INDEX_MY][num];
bowls[PLAYER_INDEX_MY][num] = 0;
let index: number = num + 1;
while (seeds > 0) {
    const playerIndex: number = (Math.floor(index / BOWLS_SIZE) % PLAYER_SIZE - 1) * -1;
    const columnIndex: number = index % BOWLS_SIZE;

    // is enemyStore
    if (playerIndex === PLAYER_INDEX_OPP && columnIndex === RESERVE_INDEX) {
        index++;
        continue;
    }

    bowls[playerIndex][columnIndex]++;

    index++;
    seeds--;
}

// console.log('answer');
console.log(`${bowls[PLAYER_INDEX_OPP].slice(0, RESERVE_INDEX).join(' ')} [${bowls[PLAYER_INDEX_OPP][RESERVE_INDEX]}]`);
console.log(`${bowls[PLAYER_INDEX_MY].slice(0, RESERVE_INDEX).join(' ')} [${bowls[PLAYER_INDEX_MY][RESERVE_INDEX]}]`);
if (index % BOWLS_SIZE === 0) {
    console.log('REPLAY');
}
