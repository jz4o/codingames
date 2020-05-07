/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const ms: string[] = [];
const N: number = parseInt(readline());
for (let i = 0; i < N; i++) {
    const M: string = readline();

    ms.push(M);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const MONTHS: string[] = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
const NUMS: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b'];

const monthlyToNumber = (monthlyStr: string): number => {
    return monthlyStr.match(/.{3}/g).reverse().reduce((sum, month, index) => {
        const base: number = Math.pow(NUMS.length, index);
        const monthNum: number = parseInt(NUMS[MONTHS.indexOf(month)], NUMS.length);

        return sum + (monthNum * base);
    }, 0);
}

const numberToMonthly = (num: number): string => {
    const monthlies: string[] = num.toString(NUMS.length).split('').map(char => {
        return MONTHS[NUMS.indexOf(char)];
    });

    return monthlies.join('');
}

const sum: number = ms.reduce((sum, m) => sum + monthlyToNumber(m), 0);
const result: string = numberToMonthly(sum);

// console.log('answer');
console.log(result);
