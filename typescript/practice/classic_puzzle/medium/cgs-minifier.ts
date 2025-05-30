/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const cgsContents: string[] = [];
const N: number = parseInt(readline());
for (let i = 0; i < N; i++) {
    const cgsContent: string = readline();

    cgsContents.push(cgsContent);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const CODE_POINT_A: number = 97; // 'a'

const variables: {[key: string]: string} = {};
const characters: string[] = [];
const replacedCgsContents: string[] = cgsContents.map(cgsContent => {
    let tempCgsContent: string = cgsContent;

    // replace variable part
    (tempCgsContent.match(/\$.+?\$/g) || []).forEach(variable => {
        if (!(variable in variables)) {
            variables[variable] = `$${String.fromCharCode(CODE_POINT_A + Object.keys(variables).length)}$`;
        }

        const escapedVariable: string = variable.replace(/\$/g, '\\$');
        tempCgsContent = tempCgsContent.replace(new RegExp(escapedVariable, 'g'), variables[variable]);
    });

    // replace character part
    (tempCgsContent.match(/'.+'/) || []).forEach(character => {
        tempCgsContent = tempCgsContent.replace(new RegExp(character, 'g'), `$${characters.length}`);
        characters.push(character);
    });

    // replace spaces
    tempCgsContent = tempCgsContent.replace(/\s/g, '');

    return tempCgsContent;
});

// restore character part
const result: string = characters.reduce((result, character, index) => {
    return result.replace(new RegExp(`\\$${index}`, 'g'), character);
}, replacedCgsContents.join(''));

// console.log('minified all CGS content');
console.log(result);

