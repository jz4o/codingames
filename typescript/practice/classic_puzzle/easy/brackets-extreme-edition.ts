/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const expression: string = readline();

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const BRACKETS: { [key: string]: string; } = {
    '(': ')',
    '[': ']',
    '{': '}'
};

const chars: string[] = [];
const collectFlag: boolean = !expression.replace(/[^\[\]\(\)\{\}]/g, '')
                                        .split('')
                                        .some(b => {
                                            if (BRACKETS[b]) {
                                                chars.push(b);
                                                return;
                                            }
                                            if (BRACKETS[chars.pop()] === b) {
                                                return;
                                            }

                                            return true;;
                                        })

// console.log('true/false');
console.log(collectFlag && chars.length === 0);
