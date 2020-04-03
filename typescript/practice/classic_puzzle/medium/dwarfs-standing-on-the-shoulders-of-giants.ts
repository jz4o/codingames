/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline()); // the number of relationships of influence
const relationMap: {[key: number]: number[]} = {};
for (let i = 0; i < n; i++) {
    var inputs: string[] = readline().split(' ');
    const x: number = parseInt(inputs[0]); // a relationship of influence between two people (x influences y)
    const y: number = parseInt(inputs[1]);

    if (!(x in relationMap)) {
        relationMap[x] = [];
    }
    relationMap[x].push(y);
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

let deepLevel: number = 0;
let targets: number[] = Object.keys(relationMap).map(key => parseInt(key));
while (targets.length > 0) {
    deepLevel++;
    targets = targets.reduce((result, target) => {
        if (target in relationMap) {
            result.push(...relationMap[target]);
        }

        return result;
    }, []);
}

// The number of people involved in the longest succession of influences
// console.log('2');
console.log(deepLevel);
