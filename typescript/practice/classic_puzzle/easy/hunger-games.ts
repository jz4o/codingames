/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const tributes: number = parseInt(readline());
const playerNames: string[] = [];
for (let i = 0; i < tributes; i++) {
    const playerName: string = readline();
    playerNames.push(playerName);
}
const turns: number = parseInt(readline());
const infos: string[] = [];
for (let i = 0; i < turns; i++) {
    const info: string = readline();
    infos.push(info);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

interface KillInformation {
    killer: string[];
    killed: string[];
};

const tributeObject: { [key: string]: KillInformation } = {};

infos.forEach(info => {
    const infoElements: string[] = info.split(' ');
    const killer: string = infoElements.shift();
    infoElements.shift();

    if (!(killer in tributeObject)) {
        tributeObject[killer] = {
            killer: [],
            killed: []
        };
    }

    infoElements.forEach(infoElement => {
        const killed: string = infoElement.replace(',', '');
        if (!(killed in tributeObject)) {
            tributeObject[killed] = {
                killer: [],
                killed: []
            };
        }

        tributeObject[killed].killer.push(killer);
        tributeObject[killer].killed.push(killed);
    });
});

playerNames.sort();

const results: string[] = [];
playerNames.forEach(playerName => {
    const result: KillInformation = tributeObject[playerName];
    result.killed.sort();

    const killed: string = result.killed.length === 0 ? 'None' : result.killed.join(', ');
    const killer: string = result.killer.length === 0 ? 'Winner' : result.killer[0];

    results.push(`Name: ${playerName}`);
    results.push(`Killed: ${killed}`);
    results.push(`Killer: ${killer}`);
    results.push(''); // for empty line
});

// remove last empty line
results.pop();

// console.log('Name:');
// console.log('Killed:');
// console.log('Killer:');
results.forEach(result => {
    console.log(result);
});
