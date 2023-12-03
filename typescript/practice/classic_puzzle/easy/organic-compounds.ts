/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const compoundRows: string[] = [];
for (let i = 0; i < N; i++) {
    const COMPOUND: string = readline();
    compoundRows.push(COMPOUND);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Compound {
    canUnion: number;

    constructor(canUnion) {
        this.canUnion = canUnion;
    }
}

class Union {
    requireSize: number;

    constructor(requireSize) {
        this.requireSize = requireSize;
    }
}

const unitGrid: (Compound|Union)[][] = compoundRows.map(compound => {
    return compound.match(/.{3}/g).map(unit => {
        if (unit.startsWith('CH')) {
            const innerUnion: number = parseInt(unit.charAt(2));

            return new Compound(4 - innerUnion);
        } else {
            const size: number = unit.replace(/\s/g, '').length === 0 ? 0 : parseInt(unit.replace(/\(|\)/g, ''));

            return new Union(size);
        }
    });
});

const dummyUnion: Union = new Union(0);
unitGrid.forEach(unitRow => {
    unitRow.unshift(dummyUnion);
    unitRow.push(dummyUnion);
});
unitGrid.unshift(Array(unitGrid[0].length).fill(dummyUnion));
unitGrid.push(Array(unitGrid[0].length).fill(dummyUnion));

const maxWidth: number = Math.max(...unitGrid.map(unitRow => unitRow.length));
unitGrid.forEach(unitRow => {
    unitRow.push(...Array(maxWidth - unitRow.length).fill(dummyUnion));
});

unitGrid.forEach((unitRow, rowIndex) => {
    unitRow.forEach((unit, unitIndex) => {
        if (!(unit instanceof Compound)) {
            return;
        }

        const aroundUnits: (Compound|Union)[] = [
            unitGrid[rowIndex - 1][unitIndex],
            unitGrid[rowIndex][unitIndex - 1],
            unitGrid[rowIndex][unitIndex + 1],
            unitGrid[rowIndex + 1][unitIndex]
        ];

        aroundUnits.forEach(aroundUnit=> {
            if (aroundUnit instanceof Compound) {
                return;
            }

            unit.canUnion -= aroundUnit.requireSize;
        });
    });
});

const isValid: boolean = unitGrid.flat().every(unit => unit instanceof Union || unit.canUnion === 0);
const result: string = isValid ? 'VALID' : 'INVALID';

// console.log('answer');
console.log(result);
