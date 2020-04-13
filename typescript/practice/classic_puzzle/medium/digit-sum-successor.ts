/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const digits: number[] = [0, ...`${N}`.split('').map(i => parseInt(i))];

const decrementIndex: number = digits.lastIndexOf(digits.filter(i => i > 0).pop());
digits[decrementIndex]--;

const incrementableArray: number[] = digits.slice(0, decrementIndex);
const incrementIndex: number = incrementableArray.lastIndexOf(incrementableArray.filter(i => i < 9).pop());
digits[incrementIndex]++;

digits.push(...digits.splice(incrementIndex + 1).sort());

const result: number = parseInt(digits.join(''));

// console.log('11');
console.log(result);
