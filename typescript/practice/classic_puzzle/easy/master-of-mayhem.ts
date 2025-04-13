/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const cyborgCount: number = parseInt(readline());
const cyborgNames: string[] = [];
for (let i = 0; i < cyborgCount; i++) {
    const cyborgName: string = readline();
    cyborgNames.push(cyborgName);
}
const mayhemReportCount: number = parseInt(readline());
const mayhemReports: string[] = [];
for (let i = 0; i < mayhemReportCount; i++) {
    const mayhemReport: string = readline();
    mayhemReports.push(mayhemReport);
}
const cyborgReportCount: number = parseInt(readline());
const cyborgReports: string[] = [];
for (let i = 0; i < cyborgReportCount; i++) {
    const cyborgReport: string = readline();
    cyborgReports.push(cyborgReport);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const mayhemAttributes: { [key: string]: string} = {};
mayhemReports.forEach(mayhemReport => {
    const { attribute, value }: { [key: string]: string } = mayhemReport.match(/^Mayhem's\s(?<attribute>.*?)\s(is)?(\san?)?\s"?(?<value>.*?)"?$/).groups;
    mayhemAttributes[attribute] = value;
});

const cyborgsAttributes: { [key: string]: { [key: string]: string } } = {};
cyborgNames.forEach(name => {
    cyborgsAttributes[name] = {};
});
cyborgReports.forEach(cyborgReport => {
    const { name, attribute, value }: { [key: string]: string } = cyborgReport.match(/^(?<name>.*?)'s\s(?<attribute>.*?)\s(is)?(\san?)?\s"?(?<value>.*?)"?$/).groups;
    cyborgsAttributes[name][attribute] = value;
});

Object.entries(mayhemAttributes).forEach(([mayhemAttribute, mayhemValue]) => {
    Object.entries(cyborgsAttributes).forEach(([cyborgName, cyborgAttributes]) => {
        if (mayhemAttribute === 'word') {
            if (!('catchphrase' in cyborgAttributes)) {
                return;
            }

            if (!(cyborgAttributes['catchphrase'] || '').includes(mayhemValue)) {
                delete cyborgsAttributes[cyborgName];
            }
        } else {
            if (!(mayhemAttribute in cyborgAttributes)) {
                return;
            }

            if (mayhemValue !== cyborgAttributes[mayhemAttribute]) {
                delete cyborgsAttributes[cyborgName];
            }
        }
    });
});

const candidateCyborgNames: string[] = Object.keys(cyborgsAttributes);

let result: string;
if (candidateCyborgNames.length === 0) {
    result = 'MISSING';
} else if (candidateCyborgNames.length === 1) {
    result = candidateCyborgNames[0];
} else if (candidateCyborgNames.length >= 2) {
    result = 'INDETERMINATE';
}

// console.log('CYBORG');
console.log(result);
