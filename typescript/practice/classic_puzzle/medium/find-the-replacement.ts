/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const X: string = readline();
const Y: string = readline();

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const xChars: string[] = X.split('');
const yChars: string[] = Y.split('');

const replaceMap: {[key: string]: string} = {};
for (let i = 0; i < xChars.length; i++) {
    if (xChars[i] !== yChars[i]) {
        replaceMap[xChars[i]] = yChars[i];
    }
}

let replaced: string = '';
xChars.forEach(x => {
    replaced += replaceMap[x] || x;
});

// console.log('anwser');
if (X === Y) {
    console.log('NONE');
} else if (replaced === Y) {
    Object.keys(replaceMap).forEach(key => {
        console.log(`${key}->${replaceMap[key]}`);
    });
} else {
    console.log("CAN'T");
}
