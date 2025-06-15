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

interface Replace {
    from: string;
    to: string;
};

const replaces: Replace[] = s
    .split(' ')
    .filter(([replaceFrom, replaceTo]) => replaceFrom !== replaceTo)
    .map(([replaceFrom, replaceTo]) => ({from: replaceFrom, to: replaceTo}));
const replaceFromChars: string[] = [...new Set(replaces.map(replace => replace.from))];

const replaceObject: { [key: string]: string } = {};
replaces.forEach(replace => replaceObject[replace.from] = replace.to);

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

const isAmbigiousError: boolean = replaces.length !== replaceFromChars.length;
const isLoopError: boolean = Object.values(replaceRoads).some(road => road.indexOf(road[road.length - 1]) !== (road.length - 1));

const replacedMs: string[] = ms.map(m => {
    return m.split('').map(c => replaceRoads[c]?.slice(-1) || c).join('');
});

const results: string[] = isAmbigiousError || isLoopError ? ['ERROR'] : replacedMs;

// console.log('The final figure or ERROR');
results.forEach(result => {
    console.log(result);
});

