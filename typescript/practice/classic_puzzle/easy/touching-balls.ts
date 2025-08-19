/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const inputRows: [number, number, number, number][] = [];
for (let i = 0; i < N; i++) {
    const inputs: string[] = readline().split(' ');
    const x: number = parseInt(inputs[0]);
    const y: number = parseInt(inputs[1]);
    const z: number = parseInt(inputs[2]);
    const r: number = parseInt(inputs[3]);
    inputRows.push([x, y, z, r]);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

interface Ball {
    x: number;
    y: number;
    z: number;
    r: number;
};

const balls: Ball[] = inputRows.map(([x, y, z, r]) => ({ x, y, z, r }));

balls.forEach(ball => {
    const distances: number[] = balls
        .filter(b => ball !== b)
        .map(b => {
            const distanceX: number = Math.abs(ball.x - b.x);
            const distanceY: number = Math.abs(ball.y - b.y);
            const centerPointDistanceHorizontal: number = Math.sqrt(distanceX ** 2 + distanceY ** 2);

            const distanceZ: number = Math.abs(ball.z - b.z);
            const centerPointDistance: number = Math.sqrt(centerPointDistanceHorizontal ** 2 + distanceZ ** 2);

            return centerPointDistance - ball.r - b.r;
        });

    const minDistance: number = Math.min(...distances);
    if (minDistance <= 0) {
        return;
    }

    ball.r += minDistance;
});

const result: string = Math.round(balls.reduce((sum, ball) => sum + ball.r ** 3, 0)).toString();

// console.log('result');
console.log(result);

