/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const aWordSpelledOut: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const transpose: <T>(array: T[][]) => T[][] = <T>(array: T[][]): T[][] => {
    return array[0].map((_value, index) => array.map(row => row[index]));
};

const YEAR_1908_ALPHABETS: string[] = [
    'Authority', 'Bills', 'Capture', 'Destroy', 'Englishmen', 'Fractious', 'Galloping', 'High', 'Invariably',
    'Juggling', 'Knights', 'Loose', 'Managing', 'Never', 'Owners', 'Play', 'Queen', 'Remarks', 'Support',
    'The', 'Unless', 'Vindictive', 'When', 'Xpeditiously', 'Your', 'Zigzag',
];
const YEAR_1917_ALPHABETS: string[] = [
    'Apples', 'Butter', 'Charlie', 'Duff', 'Edward', 'Freddy', 'George', 'Harry', 'Ink', 'Johnnie', 'King',
    'London', 'Monkey', 'Nuts', 'Orange', 'Pudding', 'Queenie', 'Robert', 'Sugar', 'Tommy', 'Uncle', 'Vinegar',
    'Willie', 'Xerxes', 'Yellow', 'Zebra',
];
const YEAR_1927_ALPHABETS: string[] = [
    'Amsterdam', 'Baltimore', 'Casablanca', 'Denmark', 'Edison', 'Florida', 'Gallipoli', 'Havana', 'Italia',
    'Jerusalem', 'Kilogramme', 'Liverpool', 'Madagascar', 'New-York', 'Oslo', 'Paris', 'Quebec', 'Roma',
    'Santiago', 'Tripoli', 'Uppsala', 'Valencia', 'Washington', 'Xanthippe', 'Yokohama', 'Zurich',
];
const YEAR_1956_ALPHABETS: string[] = [
    'Alfa', 'Bravo', 'Charlie', 'Delta', 'Echo', 'Foxtrot', 'Golf', 'Hotel', 'India', 'Juliett', 'Kilo', 'Lima',
    'Mike', 'November', 'Oscar', 'Papa', 'Quebec', 'Romeo', 'Sierra', 'Tango', 'Uniform', 'Victor', 'Whiskey',
    'X-ray', 'Yankee', 'Zulu',
];

const NATO_ALPHABETS: string[][] = transpose([
    YEAR_1908_ALPHABETS,
    YEAR_1917_ALPHABETS,
    YEAR_1927_ALPHABETS,
    YEAR_1956_ALPHABETS,
]);

const ALPHABETS: string[] = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');

const natoIndexes: number[][] = aWordSpelledOut.split(' ').map(word => {
    const startCharIndex: number = ALPHABETS.indexOf(word.charAt(0).toUpperCase());
    const targetNatoAlphabets: string[] = NATO_ALPHABETS[startCharIndex];

    return targetNatoAlphabets
        .map((natoAlphabet, index) => natoAlphabet === word ? index : null)
        .filter(index => index !== null);
});

const [natoIndex]: number[] = natoIndexes
    .slice(1)
    .reduce((result, indexes) => {
        return result.filter(index => indexes.includes(index));
    }, natoIndexes[0]);

const resultChars: string[] = aWordSpelledOut.split(' ').map(word => {
    const startCharIndex: number = ALPHABETS.indexOf(word.charAt(0).toUpperCase());
    const targetNatoAlphabets: string[] = NATO_ALPHABETS[startCharIndex];

    const nextNatoIndex: number = (natoIndex + 1) % targetNatoAlphabets.length;

    return targetNatoAlphabets[nextNatoIndex];
});

const result: string = resultChars.join(' ');

// console.log('answer');
console.log(result);

