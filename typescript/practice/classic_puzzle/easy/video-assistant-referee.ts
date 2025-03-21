/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const pitchRows: string[] = [];
for (let i = 0; i < 15; i++) {
    const pitchRow: string = readline();
    pitchRows.push(pitchRow);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

interface Player {
    y: number;
    x: number;
    team: string;
    isActive: boolean;
};

const HALFWAY_LINE_X: number = 25;

const [ball]: string[] = pitchRows.join('').match(/o/i);
const ballY: number = pitchRows.findIndex(pitchRow => pitchRow.includes(ball));
const ballX: number = pitchRows[ballY].indexOf(ball);

const players: Player[] = pitchRows.flatMap((pitchRow, rowIndex) => {
    return pitchRow.split('').map((value, valueIndex) => {
        if (!/a|b/i.test(value)) {
            return null;
        }

        const team: string = value.toLowerCase();
        const isActive: boolean = value === value.toUpperCase();

        return { y: rowIndex, x: valueIndex, team, isActive };
    }).filter(player => player);
});

const aPlayers: Player[] = players.filter(player => player.team === 'a');
const bPlayers: Player[] = players.filter(player => player.team === 'b');
aPlayers.sort((a, b) => a.x - b.x);
bPlayers.sort((a, b) => a.x - b.x);

const offsidePositionPlayers: Player[] = [];
if ([0, 14].includes(ballY)) {
    // no one offside position players.
} else if (ball === 'o') {
    const secondBPlayerX: number = bPlayers[1].x;

    const border: number = Math.min(HALFWAY_LINE_X, ballX, secondBPlayerX);
    offsidePositionPlayers.push(...aPlayers.filter(player => player.x < border));
} else {
    const secondAPlayerX: number = aPlayers.at(-2).x;

    const border: number = Math.max(HALFWAY_LINE_X, ballX, secondAPlayerX);
    offsidePositionPlayers.push(...bPlayers.filter(player => border < player.x));
}

const offsidePlayers: Player[] = offsidePositionPlayers.filter(player => player.isActive);

const offsidePositionPlayersResult: string = offsidePositionPlayers.length === 0
    ? 'No player in an offside position.'
    : `${offsidePositionPlayers.length} player(s) in an offside position.`;

const offsideResult: string = offsidePlayers.length === 0 ? 'ONSIDE!' : 'OFFSIDE!';
const offsidePlayersResult: string = `VAR: ${offsideResult}`;

const results: string[] = [offsidePositionPlayersResult, offsidePlayersResult];

// console.log('Offside Positions');
// console.log('write VAR Decision');
results.forEach(result => {
    console.log(result);
});
