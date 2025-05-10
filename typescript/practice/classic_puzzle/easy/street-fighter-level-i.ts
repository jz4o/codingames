/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const inputs: string[] = readline().split(' ');
const champion1: string = inputs[0];
const champion2: string = inputs[1];
const N: number = parseInt(readline());
const inputRows: [string, string][] = [];
for (let i = 0; i < N; i++) {
    const inputs: string[] = readline().split(' ');
    const d: string = inputs[0];
    const ATTACK: string = inputs[1];

    inputRows.push([d, ATTACK]);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Champion {
    initialLife: number;
    life: number;
    rage: number;
    punch: number;
    kick: number;
    hit: number;

    constructor({ life, punch, kick }: { life: number, punch: number, kick: number }) {
        this.initialLife = life;
        this.life = life;
        this.punch = punch;
        this.kick = kick;

        this.hit = 0;
        this.rage = 0;
    }

    special: (_opp: Champion) => number = (_opp: Champion): number => {
        console.log(`${this.constructor.name}.special is not implement`);
        return 0;
    };

    attack: (attackType: string, opp: Champion) => number = (attackType: string, opp: Champion): number => {
        const functions: { [key: string]: (() => number) | ((opp: Champion) => number) } = {
            punch: () => this.punch,
            kick: () => this.kick,
            special: this.special,
        };
        const attackFunction = functions[attackType.toLowerCase()];
        const damage: number = attackFunction.length === 0 ? attackFunction.call(this) : attackFunction.call(this, opp);

        opp.life -= damage;
        opp.rage++;

        this.hit++;

        return this.hit;
    };

    getName: () => string = (): string => {
        return this.constructor.name.toUpperCase();
    };
}

class Ken extends Champion {
    constructor() {
        super({ life: 25, punch: 6, kick: 5 });
    }

    special: () => number = (): number => {
        const damage: number = this.rage * 3;
        this.rage = 0;

        return damage;
    };
}

class Ryu extends Champion {
    constructor() {
        super({ life: 25, punch: 4, kick: 5 });
    }

    special: () => number = (): number => {
        const damage: number = this.rage * 4;
        this.rage = 0;

        return damage;
    };
}

class Tank extends Champion {
    constructor() {
        super({ life: 50, punch: 2, kick: 2 });
    }

    special: () => number = (): number => {
        const damage: number = this.rage * 2;
        this.rage = 0;

        return damage;
    };
}

class Vlad extends Champion {
    constructor() {
        super({ life: 30, punch: 3, kick: 3 });
    }

    special: (opp: Champion) => number = (opp: Champion): number => {
        const damage: number = (this.rage + opp.rage) * 2;
        this.rage = 0;

        return damage;
    };
}

class Jade extends Champion {
    constructor() {
        super({ life: 20, punch: 2, kick: 7 });
    }

    special: () => number = (): number => {
        const damage: number = this.hit * this.rage;
        this.rage = 0;

        return damage;
    };
}

class Anna extends Champion {
    constructor() {
        super({ life: 18, punch: 9, kick: 1 });
    }

    special: () => number = (): number => {
        const damage: number = (this.initialLife - this.life) * this.rage;
        this.rage = 0;

        return damage;
    };
}

class Jun extends Champion {
    constructor() {
        super({ life: 60, punch: 2, kick: 1 });
    }

    special: () => number = (): number => {
        const damage: number = this.rage;
        this.life += this.rage;
        this.rage = 0;

        return damage;
    };
}

const championClasses: (new () => Champion)[] = [Ken, Ryu, Tank, Vlad, Jade, Anna, Jun];

const c1Class: new () => Champion = championClasses.find(champion => champion.name.toLowerCase() === champion1.toLowerCase());
const c2Class: new () => Champion = championClasses.find(champion => champion.name.toLowerCase() === champion2.toLowerCase());

const c1: Champion = new c1Class();
const c2: Champion = new c2Class();

inputRows.some(([d, attack]) => {
    if (d === '<') {
        c2.attack(attack, c1);
    } else {
        c1.attack(attack, c2);
    }

    return c1.life <= 0 || c2.life <= 0;
});

const [winner, loser]: [Champion, Champion] = c1.life < c2.life ? [c2, c1] : [c1, c2];

const result: string = `${winner.getName()} beats ${loser.getName()} in ${winner.hit} hits`;

// console.log('[winner] beats [loser] in [n] hits');
console.log(result);
