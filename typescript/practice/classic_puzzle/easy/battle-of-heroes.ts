/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const stack1Data: string = readline();
const stack2Data: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Stack {
    name: string;
    amount: number;
    health: number;
    damage: number;
    surplusDamage: number;

    constructor(name: string, amount: number, health: number, damage: number) {
       this.name = name;
       this.amount = amount;
       this.health = health;
       this.damage = damage;
       this.surplusDamage = 0;
    }
}

const combat: (attack: Stack, defense: Stack) => string[] = (attack: Stack, defense: Stack): string[] => {
    const damage: number = attack.damage * attack.amount;
    const perish: number = Math.min(Math.floor((damage + defense.surplusDamage) / defense.health), defense.amount);
    const surplusDamage: number = (damage + defense.surplusDamage) % defense.health;

    const log: string[] = [
        `${attack.amount} ${attack.name}(s) attack(s) ${defense.amount} ${defense.name}(s) dealing ${damage} damage`,
        `${perish} unit(s) perish`
    ];
    defense.amount -= perish;
    defense.surplusDamage = surplusDamage;

    return log;
};

const [stack1Name, stack1AmountStr, stack1HealthStr, stack1DamageStr]: string[] = stack1Data.split(';');
const stack1Amount: number = parseInt(stack1AmountStr);
const stack1Health: number = parseInt(stack1HealthStr);
const stack1Damage: number = parseInt(stack1DamageStr);
const stack1: Stack = new Stack(stack1Name, stack1Amount, stack1Health, stack1Damage);

const [stack2Name, stack2AmountStr, stack2HealthStr, stack2DamageStr]: string[] = stack2Data.split(';');
const stack2Amount: number = parseInt(stack2AmountStr);
const stack2Health: number = parseInt(stack2HealthStr);
const stack2Damage: number = parseInt(stack2DamageStr);
const stack2: Stack = new Stack(stack2Name, stack2Amount, stack2Health, stack2Damage);

let round: number = 0;
const results: string[] = [];
while(0 < stack1.amount) {
    round++;
    results.push(`Round ${round}`);

    results.push(...combat(stack1, stack2));
    results.push('----------');
    if (stack2.amount === 0) {
        break;
    }

    results.push(...combat(stack2, stack1));
    results.push('##########');
}

const winner: Stack = stack1.amount === 0 ? stack2 : stack1;
results.push(`${winner.name} won! ${winner.amount} unit(s) left`);

// console.log('Victory!');
results.forEach(result => {
    console.log(result);
});
