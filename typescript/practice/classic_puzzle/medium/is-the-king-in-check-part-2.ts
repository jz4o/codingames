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
    row: number,
    column: number
};

const rangeArrayFromTo: (from: number, to: number, step?: number) => number[] = (from: number, to: number, step: number = 1): number[] => {
    return [...Array(Math.floor((to - from + step) / step)).keys()].map(i => from + i * step);
};

const ENEMY_KINDS: string[] = ['B', 'N', 'R', 'Q'];
const KING_KIND: string = 'k';

const chessBoard: string[][] = chessRows.map(chessRow => chessRow.split(' '));

const kingRowIndex: number = chessBoard.findIndex(chessRow => chessRow.includes(KING_KIND));
const kingColumnIndex: number = chessBoard[kingRowIndex].indexOf(KING_KIND);
const king: Piece = { kind: KING_KIND, row: kingRowIndex, column: kingColumnIndex };

const enemies: Piece[] = chessBoard.flatMap((chessRow, rowIndex) => {
    return chessRow.map((kind, columnIndex) => {
        if (!ENEMY_KINDS.includes(kind)) {
            return null;
        }

        return { kind: kind, row: rowIndex, column: columnIndex };
    });
}).filter(enemy => enemy);

const isCheck: boolean = [...Array(enemies.length).keys()].some(index => {
    const enemy: Piece = enemies[index];
    const anotherEnemy: Piece = enemies[enemies.length - index - 1];

    const isSameRow: boolean = king.row === enemy.row;
    const isSameColumn: boolean = king.column === enemy.column;
    const isSameDiagonalLine: boolean = Math.abs(king.row - enemy.row) === Math.abs(king.column - enemy.column);

    const isSameRowAnotherEnemy: boolean = king.row === anotherEnemy.row;
    const isSameColumnAnotherEnemy: boolean = king.column === anotherEnemy.column;
    const isSameDiagonalLineAnotherEnemy : boolean = Math.abs(king.row - anotherEnemy.row) === Math.abs(king.column - anotherEnemy.column);

    const rangeRowKingAndEnemy: number[] = rangeArrayFromTo(Math.min(king.row, enemy.row), Math.max(king.row, enemy.row));
    const rangeColumnKingAndEnemy: number[] = rangeArrayFromTo(Math.min(king.column, enemy.column), Math.max(king.column, enemy.column));

    const isBlockByAnotherEnemyInRow: boolean = isSameRowAnotherEnemy && rangeColumnKingAndEnemy.includes(anotherEnemy.column);
    const isBlockByAnotherEnemyInColumn: boolean = isSameColumnAnotherEnemy && rangeRowKingAndEnemy.includes(anotherEnemy.row);
    const isBlockByAnotherEnemyInDiagonalLine: boolean = isSameDiagonalLineAnotherEnemy
        && rangeRowKingAndEnemy.includes(anotherEnemy.row)
        && rangeColumnKingAndEnemy.includes(anotherEnemy.column);

    const isCheckRow: boolean = isSameRow && !isBlockByAnotherEnemyInRow;
    const isCheckColumn: boolean = isSameColumn && !isBlockByAnotherEnemyInColumn;
    const isCheckDiagonalLine: boolean = isSameDiagonalLine && !isBlockByAnotherEnemyInDiagonalLine;

    switch (enemy.kind) {
        case 'B': return isCheckDiagonalLine;
        case 'N': return !isSameRow && !isSameColumn && Math.abs(king.row - enemy.row) + Math.abs(king.column - enemy.column) === 3;
        case 'R': return isCheckRow || isCheckColumn;
        case 'Q': return isCheckRow || isCheckColumn || isCheckDiagonalLine;
    }
});

const result: string = isCheck ? 'Check' : 'No Check';

// console.log('Check/No Check');
console.log(result);
