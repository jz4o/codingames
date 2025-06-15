/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const inputRows: [string, number, number, string, number, number, string, number, number][] = [];
for (let i = 0; i < n; i++) {
    const [A, xAStr, yAStr, B, xBStr, yBStr, C, xCStr, yCStr]: string[] = readline().split(' ');
    const xA: number = parseInt(xAStr);
    const yA: number = parseInt(yAStr);
    const xB: number = parseInt(xBStr);
    const yB: number = parseInt(yBStr);
    const xC: number = parseInt(xCStr);
    const yC: number = parseInt(yCStr);

    inputRows.push([A, xA, yA, B, xB, yB, C, xC, yC]);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const RIGHT_ANGLE: number = 90;

const calcDistance: (y1: number, x1: number, y2: number, x2: number) => number = (y1: number, x1: number, y2: number, x2: number): number => {
    const diffY: number = Math.abs(y1 - y2);
    const diffX: number = Math.abs(x1 - x2);
    if (diffY === 0) {
        return diffX;
    }
    if (diffX === 0) {
        return diffY;
    }

    return Math.sqrt(Math.pow(diffY, 2) + Math.pow(diffX, 2));
};

const calcAngle: (target: number, other1: number, other2: number) => number = (target: number, other1: number, other2: number): number => {
    return Math.acos((Math.pow(other1, 2) + Math.pow(other2, 2) - Math.pow(target, 2)) / (2 * other1 * other2)) * 180 / Math.PI;
};

const getArticle: (nextWord: string) => string = (nextWord: string): string => {
    return /^[aeiou]/.test(nextWord) ? 'an' : 'a';
};

const results: string[] = inputRows.map(([a, xA, yA, b, xB, yB, c, xC, yC]) => {
    const vertexNames: string[] = [a, b, c];

    const distanceA: number = calcDistance(yB, xB, yC, xC);
    const distanceB: number = calcDistance(yA, xA, yC, xC);
    const distanceC: number = calcDistance(yA, xA, yB, xB);
    const distances: number[] = [distanceA, distanceB, distanceC];
    let sideNature: string;
    if ([...new Set(distances)].length === 3) {
        sideNature = 'scalene';
    } else {
        const vertexIndex: number = distances.findIndex(distance => distances.filter(d => d === distance).length === 1);
        const vertexName: string = vertexNames[vertexIndex];

        sideNature = `isosceles in ${vertexName}`;
    }
    const sideArticle: string = getArticle(sideNature);

    // round for adjust accuracy
    const angleA: number = Math.round(calcAngle(distanceA, distanceB, distanceC) * 10) / 10;
    const angleB: number = Math.round(calcAngle(distanceB, distanceA, distanceC) * 10) / 10;
    const angleC: number = Math.round(calcAngle(distanceC, distanceA, distanceB) * 10) / 10;
    const angles: number[] = [angleA, angleB, angleC];
    let angleNature: string;
    if (angles.includes(RIGHT_ANGLE)) {
        const vertexName: string = vertexNames[angles.indexOf(RIGHT_ANGLE)];

        angleNature = `right in ${vertexName}`;
    } else if (angles.some(angle => angle > RIGHT_ANGLE)) {
        const obtuseVertexIndex: number = angles.findIndex(angle => angle > RIGHT_ANGLE);
        const vertexName: string = vertexNames[obtuseVertexIndex];
        const angle: number = Math.round(angles[obtuseVertexIndex]);

        angleNature = `obtuse in ${vertexName} (${angle}°)`;
    } else {
        angleNature = 'acute';
    }
    const angleArticle: string = getArticle(angleNature);

    return `${vertexNames.join('')} is ${sideArticle} ${sideNature} and ${angleArticle} ${angleNature} triangle.`;
});

// console.log('answer');
results.forEach(result => {
    console.log(result);
});

