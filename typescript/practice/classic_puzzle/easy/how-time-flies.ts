/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const BEGIN: string = readline();
const END: string = readline();

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const [beginDay, beginMonth, beginYear] = BEGIN.split('.')
const [endDay, endMonth, endYear] = END.split('.')

const beginDate: Date = new Date(`${beginYear}/${beginMonth}/${beginDay}`);
const endDate: Date = new Date(`${endYear}/${endMonth}/${endDay}`);

const beginMonths: number = beginDate.getFullYear() * 12 + (beginDate.getMonth() + 1);
const endMonths: number = endDate.getFullYear() * 12 + (endDate.getMonth() + 1);
const year: number = Math.floor((endMonths - beginMonths) / 12);
let month: number = (endMonths - beginMonths) % 12;
if (endDate.getDate() < beginDate.getDate()) {
    month--;
}
const days: number = (endDate.getTime() - beginDate.getTime()) / 1000 / 60 / 60 / 24;

let formattedYear: string;
if (year > 0) {
    formattedYear = `${year} year`;
    if (year > 1) {
        formattedYear += 's';
    }
}

let formattedMonth: string;
if (month > 0) {
    formattedMonth = `${month} month`;
    if (month > 1) {
        formattedMonth += 's';
    }
}

const formattedDays = `total ${days} days`;

// console.log('YY year[s], MM month[s], total NN days');
const result = [formattedYear, formattedMonth, formattedDays].filter(str => str).join(', ');
console.log(result);
