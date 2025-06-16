/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const a: number = parseFloat(inputs[0]);
const b: number = parseFloat(inputs[1]);
const c: number = parseFloat(inputs[2]);

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Point {
    static #DECIMALS_DIGITS: number = 2;

    x: number;
    y: number;

    constructor(x: number, y: number) {
        this.x = x;
        this.y = y;
    }

    toString: () => string = (): string => {
        const formattedX: string = Point.#formatAxis(this.x);
        const formattedY: string = Point.#formatAxis(this.y);

        return `(${formattedX},${formattedY})`;
    };

    static #formatAxis: (axis: number) => string = (axis: number): string => {
        return axis.toFixed(Point.#DECIMALS_DIGITS).replace(/\.?0+$/, '');
    };
}

const delta: number = (b ** 2) - (4 * a * c);

const points: Point[] = [];

// x axis
if (a !== 0 || b !== 0) {
    if (a === 0) {
        points.push(new Point(-c / b, 0));
    } else if (delta === 0) {
        points.push(new Point(-b / (2 * a), 0));
    } else if (delta > 0) {
        points.push(new Point((-b + Math.sqrt(delta)) / (2 * a), 0));
        points.push(new Point((-b - Math.sqrt(delta)) / (2 * a), 0));
    }
}

// y axis
points.push(new Point(0, c));

points.sort((a, b) => {
    if (a.x !== b.x) {
        return a.x - b.x;
    }

    return a.y - b.y;
});

const result: string = points.map(point => point.toString()).join(',');

// console.log('(X1,Y1),...,(Xn,Yn)');
console.log(result);

