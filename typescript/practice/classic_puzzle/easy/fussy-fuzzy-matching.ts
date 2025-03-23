/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const letterCase: string = readline();
const letterFuzz: number = parseInt(readline());
const numberFuzz: number = parseInt(readline());
const otherFuzz: string = readline();
const template: string = readline();
const n: number = parseInt(readline());
const candidates: string[] = [];
for (let i = 0; i < n; i++) {
    const candidate: string = readline();
    candidates.push(candidate);
}
// for (let i = 0; i < n; i++) {
//
//     // Write an answer using console.log()
//     // To debug: console.error('Debug messages...');
//
//     console.log('true/false');
// }

const zip: <T, U>(a: T[], b: U[]) => [T, U][] = <T, U>(a: T[], b: U[]): [T, U][] => {
    const arraySize: number = Math.max(a.length, b.length);
    return [...Array(arraySize).keys()].map(index => {
        return [a[index], b[index]];
    });
};

const templateElements: string[] = (letterCase === 'true' ? template : template.toLowerCase()).match(/\d+|./g);

const results: string[] = candidates.map(candidate => {
    const elements: string[] = (letterCase === 'true' ? candidate : candidate.toLowerCase()).match(/\d+|./g);
    if (templateElements.length !== elements.length) {
        return 'false';
    }

    const boolResult: boolean = zip(templateElements, elements).every(([templateElement, element]) => {
        if (/[a-zA-Z]/.test(templateElement)) {
            if (!/[a-zA-Z]/.test(element) || letterFuzz < Math.abs(templateElement.charCodeAt(0) - element.charCodeAt(0))) {
                return false;
            }
        } else if (/\d+/.test(templateElement)) {
            if (!/\d+/.test(element) || numberFuzz < Math.abs(parseInt(templateElement) - parseInt(element))) {
                return false;
            }
        } else if (/\d+|[a-zA-Z]/.test(element) || (otherFuzz === 'true' && templateElement !== element)) {
            return false;
        }

        return true;
    });

    return boolResult.toString().toLowerCase();
});

results.forEach(result => {
    console.log(result);
});
