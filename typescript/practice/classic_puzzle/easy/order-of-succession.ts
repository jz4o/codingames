/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const inputRows: [string, string, number, string, string, string][] = [];
for (let i = 0; i < n; i++) {
    const inputs: string[] = readline().split(' ');
    const name: string = inputs[0];
    const parent: string = inputs[1];
    const birth: number = parseInt(inputs[2]);
    const death: string = inputs[3];
    const religion: string = inputs[4];
    const gender: string = inputs[5];

    inputRows.push([name, parent, birth, death, religion, gender]);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

interface Person {
    name: string;
    parent: string;
    birth: number;
    death: string;
    religion: string;
    gender: string;
};

const people: Person[] = inputRows.map(([name, parent, birth, death, religion, gender]) => {
    return {name, parent, birth, death, religion, gender};
});

const results: string[] = [];
const tempPeople: Person[] = people.filter(person => person.parent === '-');
while (tempPeople.length > 0) {
    const tempPerson: Person = tempPeople.shift();
    if (tempPerson.death === '-' && tempPerson.religion.toLowerCase() !== 'catholic') {
        results.push(tempPerson.name);
    }

    const nextPeople: Person[] = people
        .filter(person => person.parent === tempPerson.name)
        .sort((l, r) => {
            if (l.gender !== r.gender) {
                return r.gender.charCodeAt(0) - l.gender.charCodeAt(0);
            }

            return l.birth - r.birth;
        });

    tempPeople.unshift(...nextPeople);
}

// console.log('orDeroFsucceSsion');
results.forEach(result => {
    console.log(result);
});
