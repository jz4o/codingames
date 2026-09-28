/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const row: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArray: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    if (step > 0 && from <= to) {
        return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
    } else if (step < 0 && from >= to) {
        return [...Array(Math.floor((from - to + Math.abs(step)) / Math.abs(step))).keys()].map(i => from + i * step);
    } else {
        return [];
    }
};

const eachSlice: <T>(array: T[], n: number) => T[][] = <T>(array: T[], n: number): T[][] => {
    return [...Array(Math.ceil(array.length / n)).keys()].map(i => array.slice(i * n, i * n + n));
};

const originalPeople: string[] = eachSlice(row.split(''), 2).map(sliced => sliced.join(''));

const step1People: string[] = originalPeople.map(person => {
    return originalPeople.includes(person.toUpperCase()) ? person.toUpperCase() : person;
});

const step2People: string[] = step1People.map((person, index) => {
    if (!/[A-Z][a-z]/.test(person)) {
        return person;
    }

    const neighbours: string[] = [
        step1People[Math.max(index - 1, 0)],
        step1People[Math.min(index + 1, step1People.length - 1)],
    ];
    if (neighbours.every(neighbour => /[a-z]{2}/.test(neighbour))) {
        return person;
    }

    const laughings: string[] = rangeArray(1, 3).flatMap(distance => {
        const lDistancePerson: string = step1People[Math.max(index - distance, 0)];
        const rDistancePerson: string = step1People[Math.min(index + distance, step1People.length - 1)];

        const isLLaughing: boolean = /[A-Z]{2}/.test(lDistancePerson);
        const isRLaughing: boolean = /[A-Z]{2}/.test(rDistancePerson);

        if (isLLaughing && isRLaughing) {
            return `${lDistancePerson.at(-1)}${rDistancePerson.at(0)}`;
        } else if (isLLaughing) {
            return lDistancePerson;
        } else if (isRLaughing) {
            return rDistancePerson;
        }

        return [];
    });

    return [...laughings, person].at(0);
});

const result: string = step2People.join('');

// console.log('row');
console.log(result);
