/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const P: number = parseInt(readline());
const properties: string[] = [];
for (let i = 0; i < P; i++) {
    const property: string = readline();
    properties.push(property);
}
const N: number = parseInt(readline());
const personRows: string[] = [];
for (let i = 0; i < N; i++) {
    const person: string = readline();
    personRows.push(person);
}
const F: number = parseInt(readline());
const formulas: string[] = [];
for (let i = 0; i < F; i++) {
    const formula: string = readline();
    formulas.push(formula);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const zip: <T, U>(a: T[], b: U[]) => [T, U][] = <T, U>(a: T[], b: U[]): [T, U][] => {
    const arraySize: number = Math.max(a.length, b.length);
    return [...Array(arraySize).keys()].map(index => {
        return [a[index], b[index]];
    });
};

properties.unshift('name');

const people: { [key: string]: string }[] = personRows.map(personRow => {
    const personProperties: string[] = personRow.split(' ');

    const person: { [key: string]: string } = {};
    zip(properties, personProperties).forEach(([propertyName, personProperty]) => {
        person[propertyName] = personProperty;
    });

    return person;
});

const results: string[] = formulas.map(formula => {
    const conditions: string[][] = formula.split(' AND ').map(condition => condition.split('=', 2));
    const resultPeople: { [key: string]: string }[] = conditions.reduce((resultPeople, condition) => {
        const [propertyName, value]: string[] = condition;
        return resultPeople.filter(person => person[propertyName] === value);
    }, people);

    return resultPeople.length.toString();
});

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
