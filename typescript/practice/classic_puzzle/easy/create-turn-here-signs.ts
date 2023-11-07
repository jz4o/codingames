/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const input: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const inputElements: string[] = input.split(' ');
const direction: string = inputElements.shift();
const [howManyArrows, heightOfArrows, strokeThicknessOfArrows, spacingBetweenArrows, additionalIndentOfEachLine]: number[] = inputElements.map(element => parseInt(element));

const results: string[] = [...Array(heightOfArrows).keys()].map(index => {
    const directionIsRight: boolean = direction === 'right';

    const arrowParts: string = (directionIsRight ? '>' : '<').repeat(strokeThicknessOfArrows);

    const spaceParts: string = ' '.repeat(spacingBetweenArrows);

    const centerRowIndex: number = Math.floor(heightOfArrows / 2);
    const diffFromCenterRowIndex: number = Math.abs(centerRowIndex - index);
    const indentNestSize: number = directionIsRight ? centerRowIndex - diffFromCenterRowIndex : diffFromCenterRowIndex;
    const indentParts: string = ' '.repeat(additionalIndentOfEachLine * indentNestSize);

    return indentParts + Array(howManyArrows).fill(arrowParts).join(spaceParts);
});

// console.log('The Turn Here Sign');
results.forEach(result => {
    console.log(result);
});
