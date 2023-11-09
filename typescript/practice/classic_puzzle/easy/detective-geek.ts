/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const time: string = readline();
const address: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const MONTHS: string[] = ['jan', 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aug', 'sep', 'oct', 'nov', 'dec'];

const timeInt: string = parseInt(time.replace(/\*/g, '0').replace(/#/g, '1'), 2).toString().padStart(4, '0');
const formattedTime: string = `${timeInt.slice(0, 2)}:${timeInt.slice(-2)}`;

const decryptedAddress: string = address.split(' ').map(word => {
    const monthChars: string = word.match(/.{3}/g).map(month => {
        return MONTHS.indexOf(month).toString(MONTHS.length);
    }).join('');

    return String.fromCharCode(parseInt(monthChars, MONTHS.length));
}).join('');

const results: string[] = [formattedTime, decryptedAddress];

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
