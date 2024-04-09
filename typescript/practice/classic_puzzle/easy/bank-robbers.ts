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

const vaults: Vault[] = [];
for (let i = 0; i < V; i++) {
    const inputs: string[] = readline().split(' ');
    const C: number = parseInt(inputs[0]);
    const N: number = parseInt(inputs[1]);

    vaults.push({c: C, n: N});
}

// Write an action using console.log()
// To debug: console.error('Debug messages...');

const robbers: number[] = Array(R).fill(0);
for (const vault of vaults) {
    const vaultTime: number = (10 ** vault.n) * (5 ** (vault.c - vault.n));
    const minimumVaultTime: number = Math.min(...robbers);
    robbers[robbers.indexOf(minimumVaultTime)] += vaultTime;
}

// console.log('1');
const maximumVaultTime: number = Math.max(...robbers);
console.log(maximumVaultTime);

