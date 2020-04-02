/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: string = readline();

// Write an action using console.log()
// To debug: console.error('Debug messages...');

function buildAddItems(array: number[]): string {
    return array.length >= 3 ? `${array.shift()}-${array.pop()}` : array.join(',')
}

const numbers: number[] = N.replace(/[\[\]]/g, '')
                           .split(',')
                           .map(n => parseInt(n))
                           .sort((n1, n2) => n1 < n2 ? -1 : 1);

const result: string[] = [];
let temp: number[] = [];
while (numbers.length > 0) {
    if (temp.length === 0 || (temp[temp.length - 1] + 1) === numbers[0]) {
        temp.push(numbers.shift());
    } else {
        result.push(buildAddItems(temp));
        temp = [];
    }
}

if (temp.length > 0) {
    result.push(buildAddItems(temp));
}

// console.log('answer');
console.log(result.join(','));
