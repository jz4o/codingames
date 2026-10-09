/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const e: number = parseInt(inputs[0], 10);
const f: number = parseInt(inputs[1], 10);
const s: number = parseInt(inputs[2], 10);
const b: number = parseInt(inputs[3], 10);

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const ingredientCounts: { [key: string]: number } = {
    egg: e,
    flour: f,
    sugar: s,
    butter: b,
};

const recipes: { [key: string]: { [key: string]: number } } = {
    Cookie: {
            egg: 1,
            flour: 100,
            sugar: 150,
            butter: 50,
    },
    Cake: {
            egg: 3,
            flour: 180,
            sugar: 100,
            butter: 100,
    },
    Muffin: {
            egg: 2,
            flour: 150,
            sugar: 100,
            butter: 150,
    },
};

const recipePriority: string[] = ['Cake', 'Cookie', 'Muffin'];

const canMakeCounts: { [key: string]: number } = {};
Object.entries(recipes).forEach(([name, requireIngredients]) => {
    const ingredientCanMakeCounts: number[] = Object.entries(requireIngredients).map(([ingredientName, requireCount]) => {
        return Math.floor(ingredientCounts[ingredientName] / requireCount);
    });

    canMakeCounts[name] = Math.min(...ingredientCanMakeCounts);
});

const maxCanMakeCount: number = Math.max(...Object.values(canMakeCounts));
const maxCanMakeRecipeNames: string[] = Object.entries(canMakeCounts).flatMap(([name, canMakeCount]) => {
    return canMakeCount === maxCanMakeCount ? name : [];
});

const makeRecipeName: string = recipePriority.find(recipeName => maxCanMakeRecipeNames.includes(recipeName));

const result: string = `${maxCanMakeCount} ${makeRecipeName}`;

// console.log('1 Cake');
console.log(result);
