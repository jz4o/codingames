/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const inputRows: [string, string, string][] = [];
for (let i = 0; i < N; i++) {
    const inputs: string[] = readline().split(' ');
    const parent1: string = inputs[0];
    const parent2: string = inputs[1];
    const child: string = inputs[2];

    inputRows.push([parent1, parent2, child]);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const uniq: <T>(array: T[]) => T[] = <T>(array: T[]): T[] => {
    return Array.from(new Set(array));
};

class Blood {
    type: string;
    rh: string;

    constructor(bloodString: string) {
        this.type = bloodString.slice(0, -1);
        this.rh = bloodString.slice(-1);
    }

    getTypeElements: () => string[] = (): string[] => {
        return this.type.length === 1 ? `${this.type.repeat(2)}O`.split('') : this.type.split('');
    };

    getCommonFormat: () => string = (): string => {
        return `${this.type}${this.rh}`;
    };

    static getCommonFormatType: (bloodType: string) => string = (bloodType: string): string => {
        const uniqBloodType: string = uniq(bloodType.split('')).sort().join('');

        return uniqBloodType.slice(-1) === 'O' ? uniqBloodType[0] : uniqBloodType;
    };

    static predictParentBloodStrings: (parent: Blood, child: Blood) => string[] = (parent: Blood, child: Blood): string[] => {
        const candidateRhs: string[] = parent.rh === '-' && child.rh === '+' ? ['+'] : ['+', '-'];

        const parentTypeElements: string[] = parent.getTypeElements();
        const childTypeElements: string[] = child.getTypeElements();

        const inefficientOtherParentTypeElements: string[] = parentTypeElements.flatMap(typeElement => {
            if (!childTypeElements.includes(typeElement)) {
                return [];
            }

            return childTypeElements.join('').replace(typeElement, '').split('');
        });
        const otherParentTypeElements: string[] = uniq(inefficientOtherParentTypeElements);

        const types: string[] = ['AO', 'BO', 'OO', 'AB'];

        const inefficientCandidateTypes: string[] = otherParentTypeElements
            .flatMap(typeElement => types.filter(type => type.includes(typeElement)))
            .map(bloodType => Blood.getCommonFormatType(bloodType));
        const candidateTypes: string[] = uniq(inefficientCandidateTypes);

        const candidateBloodStrings: string[] = candidateTypes.flatMap(type => {
            return candidateRhs.map(rh => `${type}${rh}`);
        }).sort();

        return candidateBloodStrings;
    };

    static predictChildBloodStrings: (parent1: Blood, parent2: Blood) => string[] = (parent1: Blood, parent2: Blood): string[] => {
        const candidateRhs: string[] = parent1.rh === '-' && parent2.rh === '-' ? ['-'] : ['+', '-'];

        const parent1TypeElements: string[] = parent1.getTypeElements();
        const parent2TypeElements: string[] = parent2.getTypeElements();
        const inefficientCandidateTypes: string[] = parent1TypeElements.flatMap(parent1Type => {
            return parent2TypeElements.map(parent2Type => Blood.getCommonFormatType(`${parent1Type}${parent2Type}`));
        });
        const candidateBloodTypes: string[] = uniq(inefficientCandidateTypes);

        const candidateBloods: Blood[] = candidateBloodTypes
            .flatMap(bloodType => candidateRhs.map(rh => new Blood(`${bloodType}${rh}`)))
            .sort((a, b) => {
                if (a.type !== b.type) {
                    return a.type > b.type ? 1 : -1;
                }

                return a.rh > b.rh ? 1 : -1;
            });
        const candidateBloodStrings: string[] = candidateBloods.map(blood => blood.getCommonFormat());

        return candidateBloodStrings;
    };
}

const results: string[] = inputRows.map(([parent1, parent2, child]) => {
    const parentBlood1: Blood = parent1 === '?' ? null : new Blood(parent1);
    const parentBlood2: Blood = parent2 === '?' ? null : new Blood(parent2);
    const childBlood: Blood = child === '?' ? null : new Blood(child);

    const predictedBloodTypes: string[] = childBlood === null
        ? Blood.predictChildBloodStrings(parentBlood1, parentBlood2)
        : Blood.predictParentBloodStrings(parentBlood1 || parentBlood2, childBlood);

    return predictedBloodTypes.length === 0 ? 'impossible' : predictedBloodTypes.join(' ');
});

// console.log('answer');
results.forEach(result => {
    console.log(result);
});

