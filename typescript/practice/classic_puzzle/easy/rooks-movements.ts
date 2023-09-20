/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

type InputRow = {
    colour: number,
    onePiece: string
};

const rookPosition: string = readline();
const nbPieces: number = parseInt(readline());
const inputRows: InputRow[] = [];
for (let i = 0; i < nbPieces; i++) {
    const inputs: string[] = readline().split(' ');
    const colour: number = parseInt(inputs[0]);
    const onePiece: string = inputs[1];

    inputRows.push({ colour, onePiece });
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
};

const BLACK: number = 1;

const piecePositions: { [key: string]: { [key: number]: number } } = {};
inputRows.forEach(inputRow => {
    const [column, strRow]: string[] = inputRow.onePiece.split('');
    const row: number = parseInt(strRow);

    if (!(column in piecePositions)) {
        piecePositions[column] = {};
    }
    piecePositions[column][row] = inputRow.colour;
});

const [rookColumn, strRookRow]: string[] = rookPosition.split('');
const rookRow: number = parseInt(strRookRow);

const availableMovements: string[] = [];

// move to top
rangeArrayFromTo(1, rookRow - 1).reverse().some(rowNum => {
    if (rookColumn in piecePositions && rowNum in piecePositions[rookColumn]) {
        if (piecePositions[rookColumn][rowNum] === BLACK) {
            availableMovements.push(`R${rookPosition}x${rookColumn}${rowNum}`);
        }
        return true;
    }

    availableMovements.push(`R${rookPosition}-${rookColumn}${rowNum}`);
});

// move to bottom
rangeArrayFromTo(rookRow + 1, 8).some(rowNum => {
    if (rookColumn in piecePositions && rowNum in piecePositions[rookColumn]) {
        if (piecePositions[rookColumn][rowNum] === BLACK) {
            availableMovements.push(`R${rookPosition}x${rookColumn}${rowNum}`);
        }
        return true;
    }

    availableMovements.push(`R${rookPosition}-${rookColumn}${rowNum}`);
});

// move to left
'abcdefgh'.split('').reverse().some(column => {
    if (rookColumn[0] <= column) {
        return false;
    }

    if (column in piecePositions && rookRow in piecePositions[column]) {
        if (piecePositions[column][rookRow] === BLACK) {
            availableMovements.push(`R${rookPosition}x${column}${rookRow}`);
        }
        return true;
    }

    availableMovements.push(`R${rookPosition}-${column}${rookRow}`);
});

// move to right
'abcdefgh'.split('').some(column => {
    if (column <= rookColumn[0]) {
        return false;
    }

    if (column in piecePositions && rookRow in piecePositions[column]) {
        if (piecePositions[column][rookRow] === BLACK) {
            availableMovements.push(`R${rookPosition}x${column}${rookRow}`);
        }
        return true;
    }

    availableMovements.push(`R${rookPosition}-${column}${rookRow}`);
});

const results = availableMovements.sort();

// console.log('ANSWER');
results.forEach(result => {
    console.log(result);
});
