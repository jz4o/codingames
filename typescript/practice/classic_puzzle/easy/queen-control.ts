/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const color: string = readline();
const lines: string[] = [];
for (let i = 0; i < 8; i++) {
    const line: string = readline();
    lines.push(line);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const EMPTY: string = '.';
const QUEEN: string = 'Q';

const countControlledSquare: (board: string[][], queenY: number, queenX: number, queenColor: string) => number
    = (board: string[][], queenY: number, queenX: number, queenColor: string): number => {

    const height: number = board.length;
    const width: number = board[0].length;

    const bottomSquareSize: number = height - queenY - 1;
    const rightSquareSize: number = width - queenX - 1;

    const topSquares: string[] = [...Array(queenY).keys()].reverse().map(i => board[i][queenX]);
    const bottomRightSquareSize: number = Math.min(bottomSquareSize, rightSquareSize);
    const topRightSquares: string[] = [...Array(Math.min(queenY, rightSquareSize) + 1).keys()].slice(1).map(i => board[queenY - i][queenX + i]);
    const rightSquares: string[] = board[queenY].slice(queenX + 1);
    const bottomRightSquares: string[] = [...Array(bottomRightSquareSize + 1).keys()].slice(1).map(i => board[queenY + i][queenX + i]);
    const bottomSquares: string[] = board.slice(queenY + 1).map(row => row[queenX]);
    const bottomLeftSquares: string[] = [...Array(Math.min(bottomSquareSize, queenX) + 1).keys()].slice(1).map(i => board[queenY + i][queenX - i]);
    const leftSquares: string[] = board[queenY].slice(0, queenX).reverse();
    const topLeftSquares: string[] = [...Array(Math.min(queenY, queenX) + 1).keys()].slice(1).map(i => board[queenY - i][queenX - i]);

    const squareLines = [
        topSquares,
        topRightSquares,
        rightSquares,
        bottomRightSquares,
        bottomSquares,
        bottomLeftSquares,
        leftSquares,
        topLeftSquares
    ];

    return squareLines
        .map(squareLine => countLineControlledSquare(squareLine, queenColor))
        .reduce((sum, count) => sum + count, 0);
};

const countLineControlledSquare: (squares, queenColor: string) => number = (squares, queenColor: string): number => {
    const pieceIndex: number = squares.findIndex(square => square !== EMPTY);

    return pieceIndex + (squares[pieceIndex] === queenColor ? 0 : 1);
};

const c: string = color.charAt(0);

const board: string[][] = lines.map(line => `${c}${line}${c}`.split(''));
board.unshift(Array(10).fill(c));
board.push(Array(10).fill(c));

const queenY: number = board.findIndex(row => row.includes(QUEEN));
const queenX: number = board[queenY].indexOf(QUEEN);

const result: string = countControlledSquare(board, queenY, queenX, c).toString();

// console.log('answer');
console.log(result);
