/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const W: number = parseInt(readline());
const H: number = parseInt(readline());
const map: number[][] = [];
map.push(Array(W + 2).fill(1));
for (let i = 0; i < H; i++) {
    const line: number[] = [];

    const inputs: string[] = readline().split(' ');
    for (let j = 0; j < W; j++) {
        const v: number = parseInt(inputs[j]);

        line.push(v);
    }

    map.push([1, ...line, 1]);
}
map.push(Array(W + 2).fill(1));

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

let result: string;
rangeArrayFromTo(1, H).some(h => {
    return rangeArrayFromTo(1, W).some(w => {
        if (map[h][w] !== 0) {
            return false;
        }

        const aroundMasses: number[] = [];
        aroundMasses.push(map[h - 1][w - 1]); // upper left
        aroundMasses.push(map[h - 1][w]);     // upper
        aroundMasses.push(map[h - 1][w + 1]); // upper right
        aroundMasses.push(map[h][w - 1]);     // left
        aroundMasses.push(map[h][w + 1]);     // right
        aroundMasses.push(map[h + 1][w - 1]); // lower left
        aroundMasses.push(map[h + 1][w]);     // under
        aroundMasses.push(map[h + 1][w + 1]); // lower right
        if (aroundMasses.some(mass => mass !== 1)) {
            return false;
        }

        result = `${w - 1} ${h - 1}`;

        return true;
    });
});

// console.log('x y');
console.log(result);

