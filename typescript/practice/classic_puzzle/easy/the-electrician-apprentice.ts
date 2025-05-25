/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const C: number = parseInt(readline());
const wirings: string[] = [];
for (let i = 0; i < C; i++) {
    const WIRING: string = readline();
    wirings.push(WIRING);
}
const A: number = parseInt(readline());
const switches: string[] = [];
for (let i = 0; i < A; i++) {
    const SWITCH: string = readline();
    switches.push(SWITCH);
}
// for (let i = 0; i < C; i++) {
//
//     // Write an answer using console.log()
//     // To debug: console.error('Debug messages...');
//
//     console.log('ANSWER');
// }

const uniq: <T>(array: T[]) => T[] = <T>(array: T[]): T[] => {
    return Array.from(new Set(array));
};

const DESCRIPTION_TYPES: string[] = ['-', '='];

const switchStatus: { [key: string]: boolean } = {};
uniq(switches).forEach(sw => {
    const count: number = switches.filter(s => s === sw).length;
    switchStatus[sw] = count % 2 === 1;
});

const results: string[] = wirings.map(wiring => {
    const wiringElements: string[] = wiring.split(' ');

    const equipment: string = wiringElements.shift();

    const equipmentDescriptionSwitches: boolean[] = [];
    while (wiringElements.length > 0) {
        const descriptionTypeIndex: number = [...Array(wiringElements.length).keys()].reverse().find(index => DESCRIPTION_TYPES.includes(wiringElements[index]));

        const descriptionType: string = wiringElements[descriptionTypeIndex];
        const descriptionSwitches: string[] = wiringElements.slice(descriptionTypeIndex + 1);
        wiringElements.splice(descriptionTypeIndex, wiringElements.length);

        const descriptionSwitchStatuses: boolean[] = descriptionSwitches.map(s => Boolean(switchStatus[s]));
        if (descriptionType === '-') {
            equipmentDescriptionSwitches.push(descriptionSwitchStatuses.every(status => status));
        } else {
            equipmentDescriptionSwitches.push(descriptionSwitchStatuses.some(status => status));
        }
    }

    const equipmentStatus: string = equipmentDescriptionSwitches.every(sw => sw) ? 'ON' : 'OFF';

    return `${equipment} is ${equipmentStatus}`;
});

results.forEach(result => {
    console.log(result);
});
