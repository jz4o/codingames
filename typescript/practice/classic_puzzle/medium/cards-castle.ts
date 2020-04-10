/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const H: number = parseInt(readline());
const grid: string[][] = [];
for (let i = 0; i < H; i++) {
    const S: string = readline();

    grid.push(S.split(''));
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const rangeArrayFromTo = (from: number, to: number): number[] => {
    return [...Array(to - from + 1).keys()].map(i => i + from);
}

const LEFT_PART: string = '/';
const RIGHT_PART: string = '\\';
const PART_EMPTY: string = '.';

const result: boolean = rangeArrayFromTo(0, H - 1).every(height =>{
    const isBottomRow: boolean = height === H - 1;

    return rangeArrayFromTo(0, H * 2 - 1).every(width => {
        const card: string = grid[height][width];

        if (card === PART_EMPTY) {
            return true;
        }

        const isRightPart: boolean = card === RIGHT_PART;
        const sideCard: string = isRightPart ? grid[height][width - 1] : grid[height][width + 1];
        const partnerPart: string = isRightPart ? LEFT_PART : RIGHT_PART;

        const checkSideCard: boolean = sideCard === partnerPart;
        const checkUnderCard: boolean = isBottomRow || grid[height + 1][width] === partnerPart;

        return checkSideCard && checkUnderCard;
    });
});

// console.log('UNSTABLE');
console.log(result ? 'STABLE' : 'UNSTABLE');
