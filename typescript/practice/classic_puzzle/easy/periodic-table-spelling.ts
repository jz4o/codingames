/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const word: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const PERIODICS: string[] = [
    'H', 'He',  'Li', 'Be', 'B', 'C', 'N', 'O', 'F', 'Ne',
    'Na', 'Mg', 'Al', 'Si', 'P', 'S', 'Cl', 'Ar', 'K', 'Ca',
    'Sc', 'Ti', 'V', 'Cr', 'Mn', 'Fe', 'Co', 'Ni', 'Cu', 'Zn',
    'Ga', 'Ge', 'As', 'Se', 'Br', 'Kr', 'Rb', 'Sr', 'Y', 'Zr',
    'Nb', 'Mo', 'Tc', 'Ru', 'Rh', 'Pd', 'Ag', 'Cd', 'In', 'Sn',
    'Sb', 'Te', 'I', 'Xe', 'Cs', 'Ba', 'La', 'Ce', 'Pr', 'Nd',
    'Pm', 'Sm', 'Eu', 'Gd', 'Tb', 'Dy', 'Ho', 'Er', 'Tm', 'Yb',
    'Lu', 'Hf', 'Ta', 'W', 'Re', 'Os', 'Ir', 'Pt', 'Au', 'Hg',
    'Tl', 'Pb', 'Bi', 'Po', 'At', 'Rn', 'Fr', 'Ra', 'Ac', 'Th',
    'Pa', 'U', 'Np', 'Pu', 'Am', 'Cm', 'Bk', 'Cf', 'Es', 'Fm',
    'Md', 'No', 'Lr', 'Rf', 'Db', 'Sg', 'Bh', 'Hs', 'Mt', 'Ds',
    'Rg', 'Cn', 'Nh', 'Fl', 'Mc', 'Lv', 'Ts', 'Og',
];
const LOWER_PERIODICS: string[] = PERIODICS.map(periodic => periodic.toLowerCase());

const lowerWord: string = word.toLowerCase();

const periodicsArray: string[][] = [[]];
const tempResults: string[][] = [];
while (periodicsArray.length > 0) {
    const periodics: string[] = periodicsArray.pop();

    const joinedPeriodics: string = periodics.join('');
    if (joinedPeriodics === lowerWord) {
        tempResults.push(periodics);
        continue;
    }

    const remainingWord: string = lowerWord.replace(new RegExp(`^${joinedPeriodics}`), '');
    const nextPeriodicsArray: string[][] = LOWER_PERIODICS
        .filter(periodic => remainingWord.startsWith(periodic))
        .map(periodic => [...periodics, periodic]);

    periodicsArray.push(...nextPeriodicsArray);
}

const results: string[] = tempResults.map(resultPeriodics => {
    return resultPeriodics.map(periodic => PERIODICS[LOWER_PERIODICS.indexOf(periodic)]).join('');
}).sort();

if (results.length === 0) {
    results.push('none');
}

// console.log('spellings');
results.forEach(result => {
    console.log(result);
});
