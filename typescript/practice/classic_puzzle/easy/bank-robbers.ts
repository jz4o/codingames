/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

interface Vault {
    c: number;
    n: number;
}

const R: number = parseInt(readline());
const V: number = parseInt(readline());

let vaults: Vault[] = []
for (let i = 0; i < V; i++) {
    var inputs: string[] = readline().split(' ');
    const C: number = parseInt(inputs[0]);
    const N: number = parseInt(inputs[1]);

    vaults.push({c: C, n: N});
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

let robbers: number[] = Array(R).fill(0);
for (const vault of vaults) {
    const vaultTime: number = (10 ** vault.n) * (5 ** (vault.c - vault.n));
    const minimumVaultTime: number = robbers.reduce((a, b) => Math.min(a, b));
    robbers[robbers.indexOf(minimumVaultTime)] += vaultTime;
}

// console.log('1');
const maximumVaultTime: number = robbers.reduce((a, b) => Math.max(a, b));
console.log(maximumVaultTime);
