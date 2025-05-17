/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

interface Score {
    name: string;
    score: number;
}

interface ThrowData {
    name: string;
    x: number;
    y: number;
}

const SIZE: number = parseInt(readline());
const N: number = parseInt(readline());
const names: string[] = [];
for (let i = 0; i < N; i++) {
    const name: string = readline();

    names.push(name);
}
const T: number = parseInt(readline());
const throwDatas: ThrowData[] = [];
for (let i = 0; i < T; i++) {
    const inputs: string[] = readline().split(' ');
    const throwName: string = inputs[0];
    const throwX: number = parseInt(inputs[1]);
    const throwY: number = parseInt(inputs[2]);

    throwDatas.push({
        name: throwName,
        x: throwX,
        y: throwY
    });
};

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const HALF_SIZE: number = Math.floor(SIZE / 2);
const scoreBoard: {[key: string]: number} = {};
names.forEach(name => scoreBoard[name] = 0);

throwDatas.forEach(throwData => {
    const name: string = throwData.name;
    const x: number = throwData.x;
    const y: number = throwData.y;

    const distanceWithCenter: number = Math.sqrt(x ** 2 + y ** 2);
    const distanceWithEdge: number = Math.sqrt((HALF_SIZE - Math.abs(x)) ** 2 + (HALF_SIZE - Math.abs(y)) ** 2);

    const inSquareHorizontal: boolean = -HALF_SIZE <= x && x <= HALF_SIZE;
    const inSquareVertical: boolean = -HALF_SIZE <= y && y <= HALF_SIZE;

    const inSquare: boolean = inSquareHorizontal && inSquareVertical;
    const inCircle: boolean = distanceWithCenter <= HALF_SIZE;
    const inDiamond: boolean = distanceWithCenter <= distanceWithEdge;

    if (inDiamond) {
        scoreBoard[name] += 15;
    } else if (inCircle) {
        scoreBoard[name] += 10;
    } else if (inSquare) {
        scoreBoard[name] += 5;
    }
});

const scoreRanking: Score[] = [];
Object.keys(scoreBoard).forEach(name => {
    scoreRanking.push({name: name, score: scoreBoard[name]});
});

// score DESC, name index ASC
scoreRanking.sort((s1, s2) => {
    if (s1.score === s2.score) {
        return names.indexOf(s1.name) - names.indexOf(s2.name);
    } else {
        return s2.score - s1.score;
    }
});

// console.log('answer');
scoreRanking.forEach(score => {
    console.log(`${score.name} ${score.score}`);
});

