/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const order: string = readline();
const side: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const layers: { [key: string]: number } = {
    'R': 1,
    'L': 1,
    'U': 1,
    'D': 1
};
const acrossGroups: string[][] = [
    ['R', 'L'],
    ['U', 'D']
];

order.split('').forEach(o => {
    acrossGroups.forEach(acrossGroup => {
        if (acrossGroup.includes(o)) {
            const ag: string = acrossGroup.find(ag => ag !== o);

            layers[ag] += layers[o];
        } else {
            acrossGroup.forEach(ag => {
                layers[ag] *= 2;
            });
        }
    });

    layers[o] = 1;
});

const result: string = layers[side].toString();

// console.log('1');
console.log(result);
