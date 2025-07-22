/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const ss: string[] = [];
for (let i = 0; i < N; i++) {
    const S: string = readline();
    ss.push(S);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const keyValueStore: Map<string, string> = new Map();
const results: string[] = ss.map(s => {
    const [command, ...commandValues]: string[] = s.split(' ');
    switch (command) {
        case 'SET':
            commandValues.forEach(keyValue => {
                const [key, value]: string[] = keyValue.split('=');
                keyValueStore.set(key, value);
            });

            return null;
        case 'GET': return commandValues.map(key => keyValueStore.get(key) || 'null').join(' ');
        case 'EXISTS': return commandValues.map(key => keyValueStore.has(key)).join(' ');
        case 'KEYS': return keyValueStore.size === 0 ? 'EMPTY' : [...keyValueStore.keys()].join(' ');
        default: return null;
    }
}).filter(result => result !== null);

// console.log('value1 value2 value3');
results.forEach(result => {
    console.log(result);
});

