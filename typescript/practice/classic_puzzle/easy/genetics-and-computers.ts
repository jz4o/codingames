/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const [parent1, parent2]: string[] = readline().split(' ');
const ratio: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const gcd: (a: number, b: number) => number = (a: number, b: number): number => {
    const min: number = Math.min(a, b);
    const max: number = Math.max(a, b);

    return min === 0 ? max : gcd(min, max % min);
};

const parent1Elements: string[] = parent1.slice(0, 2).split('').flatMap(frontChar => {
    return parent1.slice(2).split('').map(backChar => `${frontChar}${backChar}`);
});

const parent2Elements: string[] = parent2.slice(0, 2).split('').flatMap(frontChar => {
    return parent2.slice(2).split('').map(backChar => `${frontChar}${backChar}`);
});

const childCandidates: string[] = parent1Elements.flatMap(parent1Element => {
    return parent2Elements.map(parent2Element => {
        const childCandidate: string[] =  `${parent1Element}${parent2Element}`.split('');

        return childCandidate.sort().join('');
    });
});

const childCounts: { [key: string]: number } = {};
childCandidates.forEach(childCandidate => {
    if (!(childCandidate in childCounts)) {
        childCounts[childCandidate] = 0;
    }

    childCounts[childCandidate]++;
});

const ratios: number[] = ratio.split(':').map(r => {
    const rChars: string[] = r.split('');
    const rStr: string = rChars.sort().join('');

    return childCounts[rStr] || 0;
});

const gcdValue: number = gcd(ratios[0], ratios[1]);

const result: string = ratios.map(r => r / gcdValue).join(':');

// console.log('Genotypic Ratio');
console.log(result);

