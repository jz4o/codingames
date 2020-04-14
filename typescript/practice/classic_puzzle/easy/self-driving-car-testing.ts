/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const xthenCommands: string = readline();
const commands: string[] = xthenCommands.split(';');
let position: number = parseInt(commands.shift());
const commandChars: string[] = commands.reduce((chars, command) => {
    const amount: number = parseInt(command.slice(0, -1));
    const comm: string = command.slice(-1);

    chars.push(...comm.repeat(amount).split(''));

    return chars;
}, []);

const rthenRoadpatterns: string[] = [];
for (let i = 0; i < N; i++) {
    const rthenRoadpattern: string = readline();

    rthenRoadpatterns.push(rthenRoadpattern);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const results: string[] = [];
rthenRoadpatterns.forEach(rthenRoadpattern => {
    const [count, pattern] = rthenRoadpattern.split(';');
    Array(parseInt(count)).fill(null).forEach(() => {
        const command: string = commandChars.shift();
        if (command === 'L') {
            position--;
        } else if (command === 'R') {
            position++;
        }

        results.push(`${pattern.substring(0, position - 1)}#${pattern.substring(position)}`);
    });
});

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
