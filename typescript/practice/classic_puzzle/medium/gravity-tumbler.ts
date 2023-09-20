/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const _width: number = parseInt(inputs[0]);
const height: number = parseInt(inputs[1]);
const count: number = parseInt(readline());
const rasters: string[][] = [];
for (let i = 0; i < height; i++) {
    const raster: string = readline();

    rasters.push(raster.split(''));
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const transpose = array => array[0].map((_value, index) => array.map(row => row[index]));

const result: string[][] = Array(count).fill(null).reduce(result => {
    return transpose(result.map(line => line.sort())).reverse();
}, rasters);

// console.log('...');
// console.log('write ###');
result.forEach(line => {
    console.log(line.join(''));
});
