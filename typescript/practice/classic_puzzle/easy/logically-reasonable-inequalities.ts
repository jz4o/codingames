/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const rows: string[] = [];
for (let i = 0; i < n; i++) {
    const row: string = readline();
    rows.push(row);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const inheritances: { [key: string]: string[] } = {};
rows.forEach(row => {
    const [parent, child]: string[] = row.split(' > ');

    if (!(parent in inheritances)) {
        inheritances[parent] = [];
    }

    inheritances[parent].push(child);
});

const temps: string[][] = Object.keys(inheritances).map(k => [k]);
let isBreak: boolean = false;
while (temps.length > 0 && !isBreak) {
    const temp: string[] = temps.pop();

    const lastElement: string = temp[temp.length - 1];
    isBreak = (inheritances[lastElement] || []).some(inheritanceChild => {
        temps.push([...temp, inheritanceChild]);

        return temp.includes(inheritanceChild);
    });
}

const result: string = temps.length === 0 ? 'consistent' : 'contradiction';

// console.log('consistent/contradiction');
console.log(result);

