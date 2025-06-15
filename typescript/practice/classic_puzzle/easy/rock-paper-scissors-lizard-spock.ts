/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const inputRows: [number, string][] = [];
for (let i = 0; i < N; i++) {
    const [numplayerStr, SIGNPLAYER]: string[] = readline().split(' ');
    const NUMPLAYER: number = parseInt(numplayerStr);

    inputRows.push([NUMPLAYER, SIGNPLAYER]);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Player {
    num: number;
    sign: string;
    competedNums: number[];

    constructor(num: number, sign:string) {
        this.num = num;
        this.sign = sign;
        this.competedNums = [];
    }

    compete = (other: Player): string => {
        const dicisionObject: { [key: string]: { [key: string]: string } } = {
            'R': {
                'R': 'draw',
                'P': 'lose',
                'C': 'win',
                'L': 'win',
                'S': 'lose'
            },
            'P': {
                'R': 'win',
                'P': 'draw',
                'C': 'lose',
                'L': 'lose',
                'S': 'win'
            },
            'C': {
                'R': 'lose',
                'P': 'win',
                'C': 'draw',
                'L': 'win',
                'S': 'lose'
            },
            'L': {
                'R': 'lose',
                'P': 'win',
                'C': 'lose',
                'L': 'draw',
                'S': 'win'
            },
            'S': {
                'R': 'win',
                'P': 'lose',
                'C': 'win',
                'L': 'lose',
                'S': 'draw'
            },
        };

        return dicisionObject[this.sign][other.sign];
    };
}

const players: Player[] = inputRows.map(inputRow => new Player(...inputRow));

while (players.length > 1) {
    const left: Player = players.shift();
    const right: Player = players.shift();

    const compete: string = left.compete(right);
    if (compete === 'win' || (compete === 'draw' && left.num <= right.num)) {
        left.competedNums.push(right.num);
        players.push(left);
    } else {
        right.competedNums.push(left.num);
        players.push(right);
    }
}

const winner: Player = players.shift();

const results: string[] = [];
results.push(winner.num.toString());
results.push(winner.competedNums.join(' '));

// console.log('WHO IS THE WINNER?');
results.forEach(result => {
    console.log(result);
});

