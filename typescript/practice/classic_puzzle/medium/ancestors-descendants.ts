/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const count: number = parseInt(readline());
const lines: string[] = [];
for (let i = 0; i < count; i++) {
    const line: string = readline();
    lines.push(line);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Generation = {
    level: number,
    name: string
};

const generations: Generation[] = lines.map(line => {
    const level: number = line.split('').filter(c => c === '.').length;
    return { level, name: line.slice(level) };
});

const results: string[] = [];
while (generations.length !== 0) {
    const inheritances: string[] = [...Array(generations[generations.length - 1].level + 1).keys()]
        .map(l => generations.filter(generation => generation.level === l).pop().name);

    results.unshift(inheritances.join(' > '));

    let lastGeneration: Generation = generations.pop();
    while (generations.length > 0 && generations[generations.length - 1].level < lastGeneration.level) {
        lastGeneration = generations.pop();
    }
}

// console.log('answer');
results.forEach(result => {
    console.log(result);
});

