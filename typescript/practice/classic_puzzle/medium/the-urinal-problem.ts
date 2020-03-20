/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const B: string = readline();

// Write an action using console.log()
// To debug: console.error('Debug messages...');

let longestSpaceCount: number = 0;
let leftIndexInLongestSpace: number = 0;
let rightIndexInLongestSpace: number = 0;
let spaceCount: number = 0;
let leftIndexInSpace: number;
let rightIndexInSpace: number;
`${B}!`.split('').forEach((b, index) => {
    if (b === 'U') {
        if (spaceCount === 0) {
            leftIndexInSpace = index;
        }

        spaceCount++;
        rightIndexInSpace = index;
    } else {
        if (spaceCount > longestSpaceCount) {
            longestSpaceCount = spaceCount;
            leftIndexInLongestSpace = leftIndexInSpace;
            rightIndexInLongestSpace = rightIndexInSpace;
        }

        spaceCount = 0;
        leftIndexInSpace = 0;
        rightIndexInSpace = 0;
    }
});

let result: number;
if (leftIndexInLongestSpace === 0) {
    result = leftIndexInLongestSpace;
} else if (rightIndexInLongestSpace === N - 1) {
    result = rightIndexInLongestSpace;
} else {
    result = leftIndexInLongestSpace + Math.floor(longestSpaceCount / 2);
}

// console.log('0');
console.log(result);
