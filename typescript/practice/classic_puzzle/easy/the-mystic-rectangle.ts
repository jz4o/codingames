/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs1: string[] = readline().split(' ');
const x: number = parseInt(inputs1[0]);
const y: number = parseInt(inputs1[1]);
const inputs2: string[] = readline().split(' ');
const u: number = parseInt(inputs2[0]);
const v: number = parseInt(inputs2[1]);

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const WIDTH: number = 200;
const HEIGHT: number = 150;
const xDistance: number = Math.min(Math.abs(x - u), WIDTH - Math.abs(x - u));
const yDistance: number = Math.min(Math.abs(y - v), HEIGHT - Math.abs(y - v));

const DIAGONAL_MOVE_SPEED: number = 0.5;
const diagonalDistance: number = Math.min(xDistance, yDistance);
const diagonalMoveTime: number = diagonalDistance * DIAGONAL_MOVE_SPEED;

const X_MOVE_SPEED: number = 0.3;
const Y_MOVE_SPEED: number = 0.4;
const cardinalDistance: number = Math.abs(yDistance - xDistance);
const cardinalMoveSpeed: number = (xDistance < yDistance ? Y_MOVE_SPEED : X_MOVE_SPEED);
const cardinalMoveTime: number = cardinalDistance * cardinalMoveSpeed;

const moveTime: number = diagonalMoveTime + cardinalMoveTime;

const result: string = moveTime.toFixed(1);

// console.log('0.0');
console.log(result);
