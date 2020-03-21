/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const level: number = parseInt(readline());
const xp: number = parseInt(readline());
const N: number = parseInt(readline());

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const EXP_OF_PUZZLE: number = 300;

interface BlitzProg {
    level: number;
    expToLevelUp: number;
}

const reflectExp = (currentLevel: number, exp: number, levelUpExp: number = null): BlitzProg => {
    exp -= (levelUpExp || getExpForLevelUp(currentLevel));
    if (exp < 0) {
        return {level: currentLevel, expToLevelUp: exp * -1 };
    } else {
        return reflectExp(currentLevel + 1, exp);
    }
}

const getExpForLevelUp = (currentLevel: number): number => {
    return Math.floor(currentLevel * Math.sqrt(currentLevel) * 10);
}

// console.log('answer');
const result: BlitzProg = reflectExp(level, EXP_OF_PUZZLE * N, xp);
console.log(result.level);
console.log(result.expToLevelUp);
