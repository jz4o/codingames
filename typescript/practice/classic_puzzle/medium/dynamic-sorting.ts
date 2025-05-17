/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const expression: string = readline();
const types: string = readline();
const N: number = parseInt(readline());
const rows: string[] = [];
for (let i = 0; i < N; i++) {
    const ROW: string = readline();
    rows.push(ROW);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

interface SortingObject {
    id?: string;
};

const zip: <T, U>(a: T[], b: U[]) => [T, U][] = <T, U>(a: T[], b: U[]): [T, U][] => {
    const arraySize: number = Math.max(a.length, b.length);
    return [...Array(arraySize).keys()].map(index => {
        return [a[index], b[index]];
    });
};

const expressions: string[] = expression.match(/[-+][a-z]+/g);

const intExpressions: string[] = zip(expressions, types.split(','))
    .filter(([_, type]) => type === 'int')
    .map(([expression, _]) => expression.slice(1));

const objects: SortingObject[] = rows.map(row => {
    const object: { [key: string]: string } = {};
    row.split(',').forEach(column => {
        const [k, v]: string[] = column.split(':');
        object[k] = v;
    });

    return object;
});

objects.sort((a, b) => {
    let isAscA: boolean;
    expressions.some(expression => {
        const isAscending: boolean = expression.startsWith('+');
        const column: string = expression.slice(1);

        if (a[column] === b[column]) {
            return false;
        }

        if (intExpressions.includes(column)) {
            if (isAscending) {
                isAscA = parseInt(a[column]) > parseInt(b[column]);
            } else {
                isAscA = parseInt(b[column]) > parseInt(a[column]);
            }
        } else {
            if (isAscending) {
                isAscA = a[column] > b[column];
            } else {
                isAscA = b[column] > a[column];
            }
        }

        return true;
    });

    if (isAscA !== undefined) {
        return isAscA ? 1 : -1;
    }

    return a.id > b.id ? 1 : -1;
});

const results: string[] = objects.map(object => object.id);

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
