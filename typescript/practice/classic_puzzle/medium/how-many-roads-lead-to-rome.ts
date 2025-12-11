/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const cs: number[] = [];
for (let i = 0; i < n; i++) {
    const inputs: string[] = readline().split(' ');
    for (let j = 0; j < 2; j++) {
        const c: number = parseInt(inputs[j]);
        cs.push(c);
    }
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const PARIS_LABEL: number = 1;
const ROME_LABEL: number = 100;

const tempCs: number[] = cs;
const cityRelations: { [key: number]: number[] } = {};
while (tempCs.length > 0) {
    const [a, b]: number[] = tempCs.splice(0, 2);

    if (!(a in cityRelations)) {
        cityRelations[a] = [];
    }

    if (!(b in cityRelations)) {
        cityRelations[b] = [];
    }

    cityRelations[a].push(b);
    cityRelations[b].push(a);
}

const routePatterns: number[][] = [];
const tempRoutePatterns: number[][] = [[PARIS_LABEL]];
while (tempRoutePatterns.length > 0) {
    const tempRoutePattern: number[] = tempRoutePatterns.pop();
    const lastCityLabel: number = tempRoutePattern[tempRoutePattern.length - 1];

    cityRelations[lastCityLabel].forEach(nextCityLabel => {
        if (tempRoutePattern.includes(nextCityLabel)) {
            return;
        }

        if (nextCityLabel === ROME_LABEL) {
            routePatterns.push(tempRoutePattern.concat(nextCityLabel));
            return;
        }

        tempRoutePatterns.push(tempRoutePattern.concat(nextCityLabel));
    });
}

const result: number = routePatterns.length;

// console.log('answer');
console.log(result);
