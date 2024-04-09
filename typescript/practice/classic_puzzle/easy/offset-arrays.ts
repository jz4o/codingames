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

const assignmentRegexp: RegExp = /([A-Z]+)\[([-\d]+)\.\.([-\d]+)\]\s=\s([-\s\d]+)/;
const assignmentObject: { [key: string]: { [key: string]: string } } = {};
assignments.forEach(assignment => {
    const [_, arrayName, strRangeBegin, strRangeEnd, strValues]: string[] = assignmentRegexp.exec(assignment);
    const rangeBegin: number = parseInt(strRangeBegin);
    const rangeEnd: number = parseInt(strRangeEnd);
    const values: string[] = strValues.split(' ');

    if (!(arrayName in assignmentObject)) {
        assignmentObject[arrayName] = {};
    }

    const targetObject: { [key: string]: string } = assignmentObject[arrayName];
    zip(rangeArrayFromTo(rangeBegin, rangeEnd), values).forEach(row => {
        const [index, value]: [number, string] = row;
        targetObject[index.toString()] = value;
    });
});

const resultRegexp: RegExp = /([A-Z]+)\[([-\d]+)\]/;
let result: string = x.toString();
while (result.match(resultRegexp)) {
    const [_, arrayName, key]: string[] = resultRegexp.exec(result);

    result = result.replace(`${arrayName}[${key}]`, assignmentObject[arrayName][key]);
}

// console.log('0');
console.log(result);
