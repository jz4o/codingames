/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const games: string[] = [];
for (let i = 0; i < N; i++) {
    const GAME: string = readline();
    games.push(GAME);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Score {
    frame: number;
    point: string;

    constructor(frame, point) {
        this.frame = frame;
        this.point = point;
    }

    getIntPoint: () => number = (): number => {
        return parseInt(this.point.replace('X', '10').replace('-', '0'));
    };
}

const results: string[] = games.map(game => {
    const scores: Score[] = game.split(' ').flatMap((score, frame) => {
        return score.split('').map(s => {
            return new Score(frame, s);
        })
    });

    [...Array(scores.length).keys()].forEach(index => {
        if (scores[index].point === '/') {
            const bonusPoint: number = scores[index].frame < 9 ? scores[index + 1].getIntPoint() : 0;

            scores[index].point = (10 - scores[index - 1].getIntPoint() + bonusPoint).toString();
        } else if (scores[index].point === 'X') {
            const bonusScores: Score[] = [];
            if (scores[index].frame < 9) {
                bonusScores.push(...scores.slice(index + 1, index + 2 + 1));
            }

            const bonusPoint: number = bonusScores.some(score => score.point === '/')
                ? 10
                : bonusScores.reduce((sum, score) => sum + score.getIntPoint(), 0);

            scores[index].point = (10 + bonusPoint).toString();
        }
    });

    const scoreObject: { [key: number]: number } = {};
    scores.forEach(score => {
        if (!(score.frame in scoreObject)) {
            scoreObject[score.frame] = 0;
        }

        scoreObject[score.frame] += score.getIntPoint();
    });

    const maxFrame: number = Object.keys(scoreObject).reduce((max, frame) => Math.max(max, parseInt(frame)), 0);
    const frameSumPoints: number[] = [];
    [...Array(maxFrame + 1).keys()].forEach(index => {
        const lastSumPoint = frameSumPoints[frameSumPoints.length - 1] || 0
        frameSumPoints.push(lastSumPoint + scoreObject[index]);
    });

    const result: string = frameSumPoints.join(' ');

    return result;
});

// console.log('5 13 18 26 31 32 34 40 47 54');
results.forEach(result => {
    console.log(result);
});
