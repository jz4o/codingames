/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const players: string[] = [];
for (let i = 0; i < N; i++) {
    const PLAYER: string = readline();
    players.push(PLAYER);
}
const playerShoots: string[] = [];
for (let i = 0; i < N; i++) {
    const SHOOTS: string = readline();
    playerShoots.push(SHOOTS);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const zip: <T, U>(a: T[], b: U[]) => [T, U][] = <T, U>(a: T[], b: U[]): [T, U][] => {
    const arraySize: number = Math.max(a.length, b.length);
    return [...Array(arraySize).keys()].map(index => {
        return [a[index], b[index]];
    });
};

const TARGET_POINT: number = 101;
const MISS_SHOOT: string = 'X';

const reachedRounds: { [key: string]: number } = {};
zip(players, playerShoots).forEach(([player, shoots]) => {
    let point: number = 0;
    let gameRound: number = 0;
    const shootsArray: string[] = shoots.split(' ');
    while (shootsArray.length > 0) {
        gameRound++;

        let tempPoint: number = 0;
        const tempShoots: string[] = [];
        [...Array(3).keys()].some(() => {
            if (shootsArray.length === 0) {
                return true;
            }

            const shoot: string = shootsArray.shift();

            let shootPoint: number;
            if (shoot.includes('*')) {
                const shootElements: number[] = shoot.split('*').map(i => parseInt(i));
                shootPoint = shootElements[0] * shootElements.at(-1);
            } else if (shoot === MISS_SHOOT) {
                shootPoint = tempShoots.length > 0 && tempShoots.at(-1) === MISS_SHOOT ? -30 : -20;
            } else {
                shootPoint = parseInt(shoot);
            }

            tempPoint += shootPoint;

            tempShoots.push(shoot);

            if (point + tempPoint >= TARGET_POINT) {
                return true;
            }
        });

        if (tempShoots.every(tempShoot => tempShoot === MISS_SHOOT)) {
            point = 0;
        } else if (point + tempPoint <= TARGET_POINT) {
            point += tempPoint;
        }
    }

    if (point === TARGET_POINT) {
        reachedRounds[player] = gameRound;
    }
});

const minRound: number = Math.min(...Object.values(reachedRounds));
const [winner, ]: [string, number] = Object.entries(reachedRounds)
    .find(([_player, gameRound]) => gameRound === minRound);

const result: string = winner;

// console.log('winner');
console.log(result);
