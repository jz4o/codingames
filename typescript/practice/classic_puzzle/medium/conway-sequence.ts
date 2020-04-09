/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const R: number = parseInt(readline());
const L: number = parseInt(readline());

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const result: number[] = [R];

for (let i = 0; i < L - 1; i++) {
    const temp: number[] = result.splice(0);
    while (temp.length > 0) {
        const firstElement: number = temp[0];
        const anotherElement: number = temp.find(i => i !== firstElement);
        const deleteSize: number = anotherElement !== undefined ? temp.indexOf(anotherElement) : temp.length;

        result.push(deleteSize, firstElement);
        temp.splice(0, deleteSize);
    }
}

// console.log('answer');
console.log(result.join(' '));
