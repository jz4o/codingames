/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const level: number = parseInt(readline());
const xp: number = parseInt(readline());
const N: number = parseInt(readline());

// Write an action using console.log()
// To debug: console.error('Debug messages...');

interface BlitzProg {
    level: number;
    expToLevelUp: number;
}

const EXP_OF_PUZZLE: number = 300;

const getExpForLevelUp = (currentLevel: number): number => {
    return Math.floor(currentLevel * Math.sqrt(currentLevel) * 10);
};

const reflectExp = (currentLevel: number, exp: number, levelUpExp: number = null): BlitzProg => {
    const reflectedExp = exp - (levelUpExp || getExpForLevelUp(currentLevel));
    if (reflectedExp < 0) {
        return {level: currentLevel, expToLevelUp: reflectedExp * -1 };
    } else {
        return reflectExp(currentLevel + 1, reflectedExp);
    }
};

// console.log('answer');
const result: BlitzProg = reflectExp(level, EXP_OF_PUZZLE * N, xp);
console.log(result.level);
console.log(result.expToLevelUp);

