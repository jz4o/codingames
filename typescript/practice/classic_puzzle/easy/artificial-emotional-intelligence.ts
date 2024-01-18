/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const name: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const AD_LIST: string[] = [
    'adaptable',
    'adventurous',
    'affectionate',
    'courageous',
    'creative',
    'dependable',
    'determined',
    'diplomatic',
    'giving',
    'gregarious',
    'hardworking',
    'helpful',
    'hilarious',
    'honest',
    'non-judgmental',
    'observant',
    'passionate',
    'sensible',
    'sensitive',
    'sincere'
];

const GOOD_LIST: string[] = ['love', 'forgiveness', 'friendship', 'inspiration', 'epic transformations', 'wins'];
const BAD_LIST: string[] = ['crime', 'disappointment', 'disasters', 'illness', 'injury', 'investment loss'];

const VOWELS: string[] = 'aeiouy'.split('');
const CONSONANTS: string[] = 'bcdfghjklmnpqrstvwxz'.split('');

const lowerName: string = name.toLowerCase().match(/[a-z]/g).join('');

const consonants: string[] = [];
lowerName.split('').forEach(char => {
    if (CONSONANTS.includes(char) && !consonants.includes(char)) {
        consonants.push(char);
    }
});
const [firstConsonant, secondConsonant, thirdConsonant]: string[] = consonants;

const vowels: string[] = lowerName.split('').map(char => {
    if (VOWELS.includes(char)) {
        return char;
    }
}).filter(char => char);
const [goodVowel, badVowel]: string[] = vowels;

const results: string[] = [];
if ([firstConsonant, secondConsonant, thirdConsonant, goodVowel, badVowel].every(target => target)) {
    const firstAd: string = AD_LIST[CONSONANTS.indexOf(firstConsonant)];
    const secondAd: string = AD_LIST[CONSONANTS.indexOf(secondConsonant)];
    const thirdAd: string = AD_LIST[CONSONANTS.indexOf(thirdConsonant)];
    const good: string = GOOD_LIST[VOWELS.indexOf(goodVowel)];
    const bad: string = BAD_LIST[VOWELS.indexOf(badVowel)];

    results.push(`It's so nice to meet you, my dear ${firstAd} ${name}.`);
    results.push(`I sense you are both ${secondAd} and ${thirdAd}.`);
    results.push(`May our future together have much more ${good} than ${bad}.`);
} else {
    results.push(`Hello ${name}.`);
}

// console.log('Hello Lisa.');
results.forEach(result => {
    console.log(result);
});
