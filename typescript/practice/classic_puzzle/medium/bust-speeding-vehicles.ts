/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const L: number = parseInt(readline());
const N: number = parseInt(readline());
const rs: string[] = [];
for (let i = 0; i < N; i++) {
    const R: string = readline();
    rs.push(R);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type RecordObject = {
    num: string,
    distance: number,
    timestamp: number
};

const records: RecordObject[] = rs.map(r => {
    const [num, distanceStr, timestampStr]: string[] = r.split(' ');
    const [distance, timestamp]: number[] = [distanceStr, timestampStr].map(elm => parseInt(elm));

    return {
        num: num,
        distance: distance,
        timestamp: timestamp
    };
});

const results: string[] = [...Array(records.length - 1).keys()].map(index => {
    const lRecord: RecordObject = records[index];
    const rRecord: RecordObject = records[index + 1];
    if (lRecord.num !== rRecord.num) {
        return;
    }

    const time: number = rRecord.timestamp - lRecord.timestamp;
    const distance: number = rRecord.distance - lRecord.distance;

    const speed: number = distance / (time / 60 / 60);
    if (speed <= L) {
        return;
    }

    const result: string = `${rRecord.num} ${rRecord.distance}`;

    return result;
}).filter(result => result);

if (results.length === 0) {
    results.push('OK');
}

// console.log('result');
results.forEach(result => {
    console.log(result);
});
