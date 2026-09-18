/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const score: number = parseInt(readline(), 10);
const darts: number = parseInt(readline(), 10);

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

const SINGLE_SEGMENTS: number[] = [...rangeArray(1, 20), 25];
const DOUBLE_SEGMENTS: number[] = [...rangeArray(1, 20), 25];
const TREBLE_SEGMENTS: number[] = rangeArray(1, 20);
const MAX_SEGMENT_SINGLE: number = Math.max(...SINGLE_SEGMENTS);
const MAX_SEGMENT_DOUBLE: number = Math.max(...DOUBLE_SEGMENTS);
const MAX_SEGMENT_TREBLE: number = Math.max(...TREBLE_SEGMENTS);

class Route {
    score: number;
    throws: string[];

    constructor(score: number = 0, throws: string[] = []) {
        this.score = score;
        this.throws = throws;
    }

    addThrow: (throwText: string) => void = (throwText: string): void => {
        if (throwText.includes('D')) {
            this.score += parseInt(throwText.slice(1), 10) * 2;
        } else if (throwText.includes('T')) {
            this.score += parseInt(throwText.slice(1), 10) * 3;
        } else {
            this.score += parseInt(throwText, 10);
        }

        this.throws.push(throwText);
    };
}

const routesToChecks: Route[] = rangeArray(1, Math.min(Math.floor(score / 2), MAX_SEGMENT_DOUBLE)).flatMap(doubleSegment => {
    return DOUBLE_SEGMENTS.includes(doubleSegment) ? new Route(doubleSegment * 2, [`D${doubleSegment}`]) : [];
});

const checkoutRoutes: Route[] = [];
while (routesToChecks.length > 0) {
    const route: Route = routesToChecks.pop();
    if (route.score === score && route.throws.length <= darts) {
        checkoutRoutes.push(route);
        continue;
    }
    if (route.score >= score || route.throws.length >= darts) {
        continue;
    }

    const amountScore: number = score - route.score;

    rangeArray(1, Math.min(amountScore, MAX_SEGMENT_SINGLE)).forEach(singleSegment => {
        if (!SINGLE_SEGMENTS.includes(singleSegment)) {
            return;
        }

        const newRoute: Route = new Route(route.score, [...route.throws]);
        newRoute.addThrow(singleSegment.toString());

        routesToChecks.push(newRoute);
    });

    rangeArray(1, Math.min(Math.floor(amountScore / 2), MAX_SEGMENT_DOUBLE)).forEach(doubleSegment => {
        if (!DOUBLE_SEGMENTS.includes(doubleSegment)) {
            return;
        }

        const newRoute: Route = new Route(route.score, [...route.throws]);
        newRoute.addThrow(`D${doubleSegment}`);

        routesToChecks.push(newRoute);
    });

    rangeArray(1, Math.min(Math.floor(amountScore / 3), MAX_SEGMENT_TREBLE)).forEach(trebleSegment => {
        if (!TREBLE_SEGMENTS.includes(trebleSegment)) {
            return;
        }

        const newRoute: Route = new Route(route.score, [...route.throws]);
        newRoute.addThrow(`T${trebleSegment}`);

        routesToChecks.push(newRoute);
    });
}

const result: string = new Set(checkoutRoutes.map(route => route.throws)).size.toString();

// console.log('answer');
console.log(result);
