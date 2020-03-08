/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const leapYear: number = parseInt(readline());
var inputs: string[] = readline().split(' ');
const sourceDayOfWeek: string = inputs[0];
const sourceMonth: string = inputs[1];
const sourceDayOfMonth: number = parseInt(inputs[2]);
var inputs: string[] = readline().split(' ');
const targetMonth: string = inputs[0];
const targetDayOfMonth: number = parseInt(inputs[1]);

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const DAY_OF_WEEK: string[] = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

// year is 0001 if leap is 0 (0001 year is not leap year)
// year is 0000 if leap is 1 (0000 year is leap year)
const year: string = `000${leapYear === 0 ? 1 : 0}`;

const targetDateTime: number = Date.parse(`${targetMonth} ${targetDayOfMonth}, ${year}`)
const sourceDateTime: number = Date.parse(`${sourceMonth} ${sourceDayOfMonth}, ${year}`)
const diffDays: number = Math.floor((targetDateTime - sourceDateTime) / 1000 / 60 / 60 / 24);

const sourceDayOfWeekIndex: number = DAY_OF_WEEK.indexOf(sourceDayOfWeek);
const targetDayOfWeekIndex: number = (sourceDayOfWeekIndex + diffDays + Math.abs(diffDays) * DAY_OF_WEEK.length) % DAY_OF_WEEK.length;

// console.log('day of week');
console.log(DAY_OF_WEEK[targetDayOfWeekIndex]);
