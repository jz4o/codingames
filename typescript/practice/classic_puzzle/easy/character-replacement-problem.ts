/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const s: string = readline();
const n: number = parseInt(readline());
const ms: string[] = [];
for (let i = 0; i < n; i++) {
    const m: string = readline();
    ms.push(m);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const sElements: string[] = s.split(' ').filter(sElement => sElement[0] !== sElement[1]);
const replaceFromChars: string[] = [...new Set(sElements.map(sElement => sElement[0]))];

const replaceObject: { [key: string]: string } = {};
sElements.forEach(sElement => replaceObject[sElement[0]] = sElement[1]);

const replaceRoads: { [key: string]: string[] } = {};
replaceFromChars.forEach(f => {
    const road: string[] = [f];
    while (road[road.length - 1] in replaceObject) {
        const t: string = replaceObject[road[road.length - 1]];

        const isExist: boolean = road.includes(t);

        road.push(t);

        if (isExist) {
            break;
        }
    }

    replaceRoads[f] = road;
});

const isAmbigiousError: boolean = sElements.length !== replaceFromChars.length;
const isLoopError: boolean = Object.values(replaceRoads).some(road => road.indexOf(road[road.length - 1]) !== (road.length - 1));

const replacedMs: string[] = ms.map(m => {
    return m.split('').map(c => replaceRoads[c]?.slice(-1) || c).join('');
});

const results: string[] = isAmbigiousError || isLoopError ? ['ERROR'] : replacedMs;

// console.log('The final figure or ERROR');
results.forEach(result => {
    console.log(result);
});
