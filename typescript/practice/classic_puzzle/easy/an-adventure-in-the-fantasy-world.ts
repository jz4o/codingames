/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const s: string = readline();
const n: number = parseInt(readline());
const ms: string[] = [];
for (let i = 0; i < n; i++) {
    const m: string = readline();
    ms.push(m);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

type Warrior = {
    y: number,
    x: number,
    money: number
};

class Enemy {
    y: number;
    x: number;
    name: string;

    constructor(y: number, x: number, name: string) {
        this.y = y;
        this.x = x;
        this.name = name;
    }
}

class Money {
    y: number;
    x: number;
    value: number;

    constructor(y: number, x: number, value: number) {
        this.y = y;
        this.x = x;
        this.value = value;
    }
}

const warrior: Warrior = { y: 0, x: 0, money: 50 };

const units: (Enemy|Money)[] = ms.map(m => {
    const [strY, strX, unitType, value]: string[] = m.split(' ');
    const y: number = parseInt(strY);
    const x: number = parseInt(strX);

    if (unitType === 'enemy') {
        return new Enemy(y, x, value);
    } else if (unitType === 'money') {
        return new Money(y, x, parseInt(value.replace('G', '')));
    } else {
        return null;
    }
}).filter(unit => unit);

let result: string;
s.split('').some(direction => {
    if (direction === 'R') {
        warrior.x++;
    } else if (direction === 'L') {
        warrior.x--;
    } else if (direction === 'U') {
        warrior.y--;
    } else if (direction === 'D') {
        warrior.y++;
    }

    const unit: (Enemy|Money) = units.find(u => u.y === warrior.y && u.x === warrior.x);
    if (unit === undefined) {
        return false;
    }

    if (unit instanceof Enemy) {
        // avoid a fight
        if (unit.name === 'goblin' && warrior.money >= 50) {
            warrior.money -= 50;
            return false;
        }

        result = `${warrior.y} ${warrior.x} ${warrior.money}G ${unit.name}`;
        return true;
    } else if (unit instanceof Money) {
        warrior.money += unit.value;
        units.splice(units.indexOf(unit), 1);
    }

    return false;
});

result ||= `GameClear ${warrior.y} ${warrior.x} ${warrior.money}G`;

// console.log('result');
console.log(result);
