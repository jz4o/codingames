/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const N: number = parseInt(readline());
const telephones: string[] = [];
for (let i = 0; i < N; i++) {
    const telephone: string = readline();

    telephones.push(telephone);
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

type TelephoneNumber = {
    childlen: { [key: string]: TelephoneNumber }
};

const telephoneNumber: TelephoneNumber = { childlen: {} };
telephones.forEach(telephone => {
    let targetTelephoneNumber: TelephoneNumber = telephoneNumber;
    telephone.split('').forEach(num => {
        if (!(num in targetTelephoneNumber.childlen)) {
            targetTelephoneNumber.childlen[num] = { childlen: {} };
        }

        targetTelephoneNumber = targetTelephoneNumber.childlen[num];
    });
});

const result: number = JSON.stringify(telephoneNumber.childlen).replace(/"childlen":/g, '').match(/:/g).length;

// The number of elements (referencing a number) stored in the structure.
// console.log('number');
console.log(result);
