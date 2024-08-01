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

let result: string;
try {
    for (let h = 1; h <= H; h++) {
        for (let w = 1; w <= W; w++) {
            if (map[h][w] !== 0) {
                continue;
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
                continue;
            }

            result = `${w - 1} ${h - 1}`;
            throw false; // global escape
        }
    }
} catch (_) {
    // for global escape
}

// # Write an action using puts
// # To debug: STDERR.puts "Debug messages..."

// console.log('x y');
console.log(result);

