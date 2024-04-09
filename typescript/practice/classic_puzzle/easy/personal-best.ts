/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const gymnasts: string = readline();
const categories: string = readline();
const N: number = parseInt(readline());
const rows: string[] = [];
for (let i = 0; i < N; i++) {
    const row: string = readline();
    rows.push(row);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Score {
    bars: number;
    beam: number;
    floor: number;

    constructor(bars: number = 0, beam: number = 0, floor: number = 0) {
        this.bars = bars;
        this.beam = beam;
        this.floor = floor;
    }

    update: (bars: number, beam: number, floor: number) => void = (bars: number, beam: number, floor: number): void => {
        this.bars = Math.max(this.bars, bars);
        this.beam = Math.max(this.beam, beam);
        this.floor = Math.max(this.floor, floor);
    };
}

const gymnastArray: string[] = gymnasts.split(',');
const categoryArray: string[] = categories.split(',');

const scores: { [key: string]: Score } = {};
rows.forEach(row => {
    const [gymnast, barsStr, beamStr, floorStr]: string[] = row.split(',');
    if (!gymnastArray.includes(gymnast)) {
        return;
    }

    const [bars, beam, floor]: number[] = [barsStr, beamStr, floorStr].map(elm => parseFloat(elm));

    if (!(gymnast in scores)) {
        scores[gymnast] = new Score();
    }

    scores[gymnast].update(bars, beam, floor);
});

const results: string[] = gymnastArray.map(gymnast => {
    const score: Score = scores[gymnast];

    return categoryArray.map(category => score[category]).join(',');
});

// console.log('0.00');
results.forEach(result => {
    console.log(result);
});
