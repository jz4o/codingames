/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const mother: string = readline();
const child: string = readline();
const numOfPossibleFathers: number = parseInt(readline());
const aPossibleFathers: string[] = [];
for (let i = 0; i < numOfPossibleFathers; i++) {
    const aPossibleFather: string = readline();
    aPossibleFathers.push(aPossibleFather);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const zip: <T, U>(a: T[], b: U[]) => [T, U][] = <T, U>(a: T[], b: U[]): [T, U][] => {
    const arraySize: number = Math.max(a.length, b.length);
    return [...Array(arraySize).keys()].map(index => {
        return [a[index], b[index]];
    });
};

const motherChromPairs: string[] = mother.match(/.*?:(.*)/).at(-1).trim().split(' ');
const childChromPairs: string[] = child.match(/.*?:(.*)/).at(-1).trim().split(' ');

const fatherChromParts: string[] = zip(motherChromPairs, childChromPairs).flatMap(([motherChromPair, childChromPair]) => {
    const fatherChromPart: string[] = childChromPair.split('').filter(childChrom => !motherChromPair.includes(childChrom));

    return fatherChromPart.length === 0 ? childChromPair : fatherChromPart;
});

const father: string = aPossibleFathers.find(aPossibleFather => {
    const aPossibleFatherChromPairs: string[] = aPossibleFather.match(/.*?:(.*)/).at(-1).trim().split(' ');

    const isFather: boolean = zip(aPossibleFatherChromPairs, fatherChromParts).every(([aPossibleFatherChromPair, fatherChromPart]) => {
        if (fatherChromPart.length === 1) {
            return aPossibleFatherChromPair.includes(fatherChromPart.charAt(0));
        } else {
            return fatherChromPart.split('').filter(fatherChrom => !aPossibleFatherChromPair.includes(fatherChrom)).length < 2;
        }
    });

    return isFather;
});

const [fatherName]: string[] = father.split(':');

const result: string = `${fatherName}, you are the father!`;

// console.log('what Maury Povich might say');
console.log(result);

