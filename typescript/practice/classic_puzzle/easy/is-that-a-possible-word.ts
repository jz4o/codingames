/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const _input: string = readline();
const states: string = readline();
const numberOfTransitions: number = parseInt(readline());
const transitions: string[] = [];
for (let i = 0; i < numberOfTransitions; i++) {
    const transition: string = readline();
    transitions.push(transition);
}
const startState: string = readline();
const endStates: string = readline();
const numberOfWords: number = parseInt(readline());
const words: string[] = [];
for (let i = 0; i < numberOfWords; i++) {
    const word: string = readline();
    words.push(word);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const stateArray: string[] = states.split(' ');
const endStateArray: string[] = endStates.split(' ');

const transitionObject: { [key: string]: { [key: string]: string } } = {};
stateArray.forEach(state => {
    transitionObject[state] = {};
});
transitions.forEach(transition => {
    const [fromState, char, toState]: string[] = transition.split(' ');

    transitionObject[fromState][char] = toState;
});

const results: string[] = words.map(word => {
    const endState: string = word.split('').reduce((state, char, _index, array) => {
        if (!(char in (transitionObject?.[state] || {}))) {
            array.splice(0); // for early break
            return '';
        }

        return transitionObject[state][char];
    }, startState);

    return endStateArray.includes(endState).toString().toLowerCase();
});

// console.log('true or false');
results.forEach(result => {
    console.log(result);
});
