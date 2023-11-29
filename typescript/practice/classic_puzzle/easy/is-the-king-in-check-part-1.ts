/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const chessRows: string[] = [];
for (let i = 0; i < 8; i++) {
    const chessRow: string = readline();
    chessRows.push(chessRow);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Piece = {
    kind: string,
    rowIndex: number,
    columnIndex: number
};

const chessBoard: string[][] = chessRows.map(chessRow => chessRow.split(' '));

const kingKind: string = 'K';
const kingRow: number = chessBoard.findIndex(chessRow => chessRow.includes(kingKind));
const kingColumn: number = chessBoard[kingRow].indexOf(kingKind);
const king: Piece = { kind: kingKind, rowIndex: kingRow, columnIndex: kingColumn };

const [enemyKind]: string[] = chessBoard.join('').match(/B|N|R|Q/);
const enemyRow: number = chessBoard.findIndex(chessRow => chessRow.includes(enemyKind));
const enemyColumn: number = chessBoard[enemyRow].indexOf(enemyKind);
const enemy: Piece = { kind: enemyKind, rowIndex: enemyRow, columnIndex: enemyColumn };

const isSameRow: boolean = king.rowIndex === enemy.rowIndex;
const isSameColumn: boolean = king.columnIndex === enemy.columnIndex;
const isSameDiagonalLine: boolean = Math.abs(king.rowIndex - enemy.rowIndex) === Math.abs(king.columnIndex - enemy.columnIndex);

let isCheck: boolean;
if (enemy.kind === 'B') {
    isCheck = isSameDiagonalLine;
} else if (enemy.kind === 'N') {
    isCheck = !isSameRow && !isSameColumn && Math.abs(king.rowIndex - enemy.rowIndex) + Math.abs(king.columnIndex - enemy.columnIndex) === 3;
} else if (enemy.kind === 'R') {
    isCheck = isSameRow || isSameColumn;
} else if (enemy.kind === 'Q') {
    isCheck = isSameRow || isSameColumn || isSameDiagonalLine;
} else {
    isCheck = false;
}

const result: string = isCheck ? 'Check' : 'No Check';

// console.log('Check/No Check');
console.log(result);
