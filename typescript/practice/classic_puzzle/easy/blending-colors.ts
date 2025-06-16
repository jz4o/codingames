/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const S: number = parseInt(inputs[0]);
const P: number = parseInt(inputs[1]);
const lines: string[] = [];
for (let i = 0; i < S; i++) {
    const line: string = readline();
    lines.push(line);
}
const xys: [number, number][] = [];
for (let i = 0; i < P; i++) {
    const inputs: string[] = readline().split(' ');
    const x: number = parseInt(inputs[0]);
    const y: number = parseInt(inputs[1]);
    xys.push([x, y]);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Color {
    static BLACK: Color = new Color(0, 0, 0);
    static WHITE: Color = new Color(255, 255, 255);

    r: number;
    g: number;
    b: number;

    constructor(r: number, g: number, b: number) {
        this.r = r;
        this.g = g;
        this.b = b;
    }

    isBlack: () => boolean = (): boolean => {
        return [this.r, this.g, this.b].every(c => c === 0);
    };

    toString: () => string = (): string => {
        return `(${this.r}, ${this.g}, ${this.b})`;
    };
}

class Point {
    x: number;
    y: number;
    colors: Color[];

    constructor(x: number, y: number) {
        this.x = x;
        this.y = y;
        this.colors = [];
    }

    addColr: (color: Color) => void = (color: Color): void => {
        this.colors.push(color);
    };

    color: () => Color = (): Color => {
        return this.#mixColors();
    };

    #mixColors: () => Color = (): Color => {
        if (this.colors.length === 0) {
            return Color.WHITE;
        }
        if (this.colors.some(color => color.isBlack())) {
            return Color.BLACK;
        }

        const r: number = Math.round(this.colors.reduce((sum, c) => sum + c.r, 0) / this.colors.length);
        const g: number = Math.round(this.colors.reduce((sum, c) => sum + c.g, 0) / this.colors.length);
        const b: number = Math.round(this.colors.reduce((sum, c) => sum + c.b, 0) / this.colors.length);

        return new Color(r, g, b);
    };
}

const points: Point[] = xys.map(([x, y]) => {
    return new Point(x, y);
});

lines.forEach(line => {
    const [name, strX, strY, strLength, strR, strG, strB]: string[] = line.split(' ');
    const [x, y, length, r, g, b]: number[] = [strX, strY, strLength, strR, strG, strB].map(elm => parseInt(elm));
    const c = new Color(r, g, b);

    if (name === 'SQUARE') {
        const minX: number = x;
        const maxX: number = x + length;
        const minY: number = y;
        const maxY: number = y + length;

        points.forEach(point => {
            if (point.x < minX || maxX < point.x || point.y < minY || maxY < point.y) {
                return;
            }

            const color: Color = [minX, maxX].includes(point.x) || [minY, maxY].includes(point.y) ? Color.BLACK : c;
            point.addColr(color);
        });
    } else if (name === 'CIRCLE') {
        const minX: number = x - length;
        const maxX: number = x + length;
        const minY: number = y - length;
        const maxY: number = y + length;

        points.forEach(point => {
            if (point.x < minX || maxX < point.x || point.y < minY || maxY < point.y) {
                return;
            }

            const diffX: number = Math.abs(x - point.x);
            const diffY: number = Math.abs(y - point.y);
            const radius: number = Math.sqrt((diffX ** 2) + (diffY ** 2));

            if (length < radius) {
                return;
            }

            const color: Color = length === radius ? Color.BLACK : c;
            point.addColr(color);
        });
    }
});

const results: string[] = points.map(point => point.color().toString());

// console.log('answer');
results.forEach(result => {
    console.log(result);
});

