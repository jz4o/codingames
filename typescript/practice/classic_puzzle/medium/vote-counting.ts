/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const M: number = parseInt(readline());
const voters: {[key: string]: number} = {};
for (let i = 0; i < N; i++) {
    const inputs: string[] = readline().split(' ');
    const personName: string = inputs[0];
    const nbVote: number = parseInt(inputs[1]);

    voters[personName] = nbVote;
}
const votes: {[key: string]: string[]} = {}
for (let i = 0; i < M; i++) {
    const inputs: string[] = readline().split(' ');
    const voterName: string = inputs[0];
    const voteValue: string = inputs[1];

    if (votes[voterName] === undefined) {
        votes[voterName] = [];
    }

    votes[voterName].push(voteValue);
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

let yes: number = 0;
let no: number = 0;
Object.keys(voters).forEach(voterName => {
    if (votes[voterName] === undefined || votes[voterName].length > voters[voterName]) {
        return;
    }

    yes += votes[voterName].filter(vote => vote === 'Yes').length;
    no += votes[voterName].filter(vote => vote === 'No').length;
});

// console.log('output');
console.log(`${yes} ${no}`);

