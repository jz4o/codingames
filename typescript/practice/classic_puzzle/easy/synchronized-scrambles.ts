/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const [offset1, offset2]: string[] = inputs;

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const offset1Int: number = parseInt(offset1, 10);
const offset2Int: number = parseInt(offset2, 10);
const offset1Seconds: number = (offset1Int < 0 ? -1 : 1) * ((Math.floor(Math.abs(offset1Int) / 100) * 60) + (Math.abs(offset1Int) % 100)) * 60;
const offset2Seconds: number = (offset2Int < 0 ? -1 : 1) * ((Math.floor(Math.abs(offset2Int) / 100) * 60) + (Math.abs(offset2Int) % 100)) * 60;
const borderTime1: Date = new Date(offset1Seconds * 1000);
const borderTime2: Date = new Date(offset2Seconds * 1000);

const results: string[] = [...Array(60 * 24).keys()].flatMap(additionalMinutes => {
    const time1: Date = new Date(borderTime1);
    time1.setMinutes(time1.getMinutes() + additionalMinutes);
    const time2: Date = new Date(borderTime2);
    time2.setMinutes(time2.getMinutes() + additionalMinutes);

    const timeStr1: string = time1.toLocaleTimeString("en-US", { hourCycle: 'h23', hour: "2-digit", minute: "2-digit" }).replace(':', '');
    const timeStr2: string = time2.toLocaleTimeString("en-US", { hourCycle: 'h23', hour: "2-digit", minute: "2-digit" }).replace(':', '');
    if (timeStr1.split('').sort().join('') !== timeStr2.split('').sort().join('')) {
        return [];
    }

    return `${timeStr1}, ${timeStr2}`;
}).sort();

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
