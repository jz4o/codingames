/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const word: string = readline();
const chars: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const BEAM:     string = '+--+';
const NO_HEAD:  string = '|';
const HEAD:     string = '|  o';
const NO_BODY:  string = '|';
const BODY:     string = '|  |';
const ONE_ARM:  string = '| /|';
const BOTH_ARM: string = '| /|\\';
const NO_LEG:   string = '|\\';
const ONE_LEG:  string = '|\\/';
const BOTH_LEG: string = '|\\/ \\';
const HANGMAN_STATUS: string[][] = [
    [BEAM, NO_HEAD, NO_BODY,  NO_LEG  ],
    [BEAM, HEAD,    NO_BODY,  NO_LEG  ],
    [BEAM, HEAD,    BODY,     NO_LEG  ],
    [BEAM, HEAD,    ONE_ARM,  NO_LEG  ],
    [BEAM, HEAD,    BOTH_ARM, NO_LEG  ],
    [BEAM, HEAD,    BOTH_ARM, ONE_LEG ],
    [BEAM, HEAD,    BOTH_ARM, BOTH_LEG]
];

// answer to guess
const result: string = word.split('').map(char => {
    return chars.includes(char.toLowerCase()) ? char : '_';
}).join('');

// counting errors of guess
let lowerWord: string = word.toLowerCase();
let errors: number = 0;
chars.split(' ').forEach(char => {
    if (lowerWord.includes(char)) {
        lowerWord = lowerWord.replace(new RegExp(char, 'g'), '');
    } else {
        errors++;
    }
});

// answer
// console.log('answer');
console.log(HANGMAN_STATUS[errors].join("\n"));
console.log(result);
