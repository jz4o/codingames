/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline(), 10);
const k: number = parseInt(readline(), 10);
const strs: string[] = [];
for (let i = 0; i < k; i++) {
    const str: string = readline();
    strs.push(str);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const preProcesses: { [key: number]: number[] } = {};
strs.forEach(str => {
    const [preProcess, process]: number[] = str.split('<').map(char => parseInt(char, 10));
    if (!(process in preProcesses)) {
        preProcesses[process] = [];
    }

    preProcesses[process].push(preProcess);
});

const isCircularReferences: (preProcess: { [key: number]: number[] }) => boolean = (preProcess: { [key: number]: number[] }): boolean => {
    const beCheckArrays: number[][] = Object.keys(preProcess).map(key => [parseInt(key, 10)]);
    let circularReferenceFlag: boolean = false;
    while (beCheckArrays.length > 0) {
        const beCheckArray: number[] = beCheckArrays.pop();

        const lastProcess: number = beCheckArray.at(-1);
        const preProcesses: number[] = preProcess[lastProcess] || [];
        preProcesses.some(preProcess => {
            if (beCheckArray.includes(preProcess)) {
                circularReferenceFlag = true;
            }

            beCheckArrays.push([...beCheckArray, preProcess]);

            return circularReferenceFlag;
        });

        if (circularReferenceFlag) {
            break;
        }
    }

    return circularReferenceFlag;
};

let result: string;
if (isCircularReferences(preProcesses)) {
    result = 'INVALID';
} else {
    const processes: number[] = rangeArrayFromTo(1, n);
    const orderedProcesses: number[] = [];
    while (processes.length > 0) {
        const process: number|null = processes.filter(process => (preProcesses[process] || []).length === 0)[0] || null;
        if (process === null) {
            break;
        }

        Object.entries(preProcesses).forEach(([key, value]) => {
            preProcesses[key] = value.filter(v => v !== process);
        });

        orderedProcesses.push(process);
        processes.splice(processes.indexOf(process), 1);
    }

    result = orderedProcesses.join(' ');
}

// console.log('answer');
console.log(result);
