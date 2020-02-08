/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

// read -r intext
const intext: string = readline();

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const result: string = intext.toLowerCase()
                             .replace(/,/g, ', ')
                             .replace(/\s+/g, ' ')
                             .split('.')
                             .map(s => s.trim())
                             .filter(s => s)
                             .map(s => s.charAt(0).toUpperCase() + s.slice(1))
                             .join('. ')
                             .replace(/ ,/g, ',')
                             .replace(/,+/g, ',')

// console.log('solution');
console.log(result + (intext.endsWith('.') ? '.' : ''));
