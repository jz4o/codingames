/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const cubeCount:number = N ** 3;
const invisibleCubeCount: number = Math.max(N - 2, 0) ** 3;

// console.log('answer');
console.log(cubeCount - invisibleCubeCount);
