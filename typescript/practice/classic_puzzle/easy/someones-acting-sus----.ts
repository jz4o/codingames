/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const _L: number = parseInt(readline());
const F: string = readline();
const inputs: string[] = readline().split(' ');
const N: number = parseInt(inputs[0]);
const _K: number = parseInt(inputs[1]);
const crewmates: string[] = [];
for (let i = 0; i < N; i++) {
    const crewmate: string = readline();
    crewmates.push(crewmate);
}
for (let i = 0; i < N; i++) {

    // Write an answer using console.log()
    // To debug: console.error('Debug messages...');

    const crewmate: string = crewmates[i];

    const logs: Log[] = [...Array(crewmate.length).keys()]
        .map(index => {
            const char: string = crewmate[index];
            return F.includes(char) ? { time: index, roomIndex: F.indexOf(char) } : null;
        })
        .filter(log => log);

    const isSus: boolean = [...Array(Math.max(logs.length - 1, 0)).keys()].some(index => {
        const l: Log = logs[index];
        const r: Log = logs[index + 1];

        const time: number = r.time - l.time;
        let distance: number = Math.abs(r.roomIndex - l.roomIndex);
        distance = Math.min(distance, F.length - distance);

        return time < distance;
    });

    const result: string = isSus ? 'SUS' : 'NOT SUS';

    // console.log('answer');
    console.log(result);
}

type Log = {
    time: number,
    roomIndex: number
};
