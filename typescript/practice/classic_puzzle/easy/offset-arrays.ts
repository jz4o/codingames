/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const assignments: string[] = [];
for (let i = 0; i < n; i++) {
    const assignment: string = readline();
    assignments.push(assignment);
}
const x: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const zip: <T, U>(a: T[], b: U[]) => [T, U][] = <T, U>(a: T[], b: U[]): [T, U][] => {
    const arraySize: number = Math.max(a.length, b.length);
    return [...Array(arraySize).keys()].map(index => {
        return [a[index], b[index]];
    });
};

const rangeArrayFromTo: (from: number, to: number) => number[] = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
};

const assignmentRegexp: RegExp = /(?<arrayName>[A-Z]+)\[(?<rangeBeginStr>[-\d]+)\.\.(?<rangeEndStr>[-\d]+)\]\s=\s(?<valuesStr>[-\s\d]+)/;
const assignmentObject: { [key: string]: { [key: string]: string } } = {};
assignments.forEach(assignment => {
    const { arrayName, rangeBeginStr, rangeEndStr, valuesStr }: { [key: string]: string } = assignment.match(assignmentRegexp).groups;
    const rangeBegin: number = parseInt(rangeBeginStr);
    const rangeEnd: number = parseInt(rangeEndStr);
    const values: string[] = valuesStr.split(' ');

    if (!(arrayName in assignmentObject)) {
        assignmentObject[arrayName] = {};
    }

    const targetObject: { [key: string]: string } = assignmentObject[arrayName];
    zip(rangeArrayFromTo(rangeBegin, rangeEnd), values).forEach(row => {
        const [index, value]: [number, string] = row;
        targetObject[index.toString()] = value;
    });
});

const resultRegexp: RegExp = /(?<arrayName>[A-Z]+)\[(?<key>[-\d]+)\]/;
let result: string = x.toString();
while (result.match(resultRegexp)) {
    const { arrayName, key }: { [key: string]: string } = result.match(resultRegexp).groups;

    result = result.replace(`${arrayName}[${key}]`, assignmentObject[arrayName][key]);
}

// console.log('0');
console.log(result);

