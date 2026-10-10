/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const worktime: number = parseInt(readline(), 10);
const nc: number = parseInt(readline(), 10);
const inputs1: string[] = readline().split(' ');
const efficiencies: number[] = [];
for (let i = 0; i < nc; i++) {
    const efficiency: number = parseFloat(inputs1[i]);
    efficiencies.push(efficiency);
}
const nv: number = parseInt(readline(), 10);
const inputs2: string[] = readline().split(' ');
const helptimes: number[] = [];
for (let i = 0; i < nv; i++) {
    const helptime: number = parseInt(inputs2[i], 10);
    helptimes.push(helptime);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Rational {
    numerator: number;
    denominator: number;

    constructor(numerator: number, denominator: number) {
        this.numerator = numerator;
        this.denominator = denominator;
    }

    calcFloat: () => number = (): number => {
        return this.numerator / this.denominator;
    };

    static add: (a: Rational, b: Rational) => Rational = (a: Rational, b: Rational): Rational => {
        const lcm: number = this._lcm(a.denominator, b.denominator);
        const numerator: number = (a.numerator * (lcm / a.denominator)) + (b.numerator * (lcm / b.denominator));
        const rational: Rational = new Rational(numerator, lcm);

        return this._reduce(rational);
    };

    static sub: (a: Rational, b: Rational) => Rational = (a: Rational, b: Rational): Rational => {
        const lcm: number = this._lcm(a.denominator, b.denominator);
        const numerator: number = (a.numerator * (lcm / a.denominator)) - (b.numerator * (lcm / b.denominator));
        const rational: Rational = new Rational(numerator, lcm);

        return this._reduce(rational);
    };

    static _reduce: (rational: Rational) => Rational = (rational: Rational): Rational => {
        const gcd: number = this._gcd(rational.numerator, rational.denominator);
        return new Rational(rational.numerator / gcd, rational.denominator / gcd);
    };

    static _gcd: (a: number, b: number) => number = (a: number, b: number): number => {
        const min: number = Math.min(Math.abs(a), Math.abs(b));
        const max: number = Math.max(a, b);

        return min === 0 ? max : this._gcd(min, max % min);
    };

    static _lcm: (a: number, b: number) => number = (a: number, b: number): number => {
        return a / this._gcd(a, b) * b;
    };
}

class Counter {
    worktime: number;
    efficiency: number;
    elapsedWorktime: Rational;
    remainingTime: Rational;
    breakCount: number;
    helpedCount: number;

    constructor(worktime: number, efficiency: number) {
        this.worktime = worktime;
        this.efficiency = efficiency;
        this.elapsedWorktime = new Rational(0, 1);
        this.remainingTime = new Rational(0, 1);
        this.breakCount = 0;
        this.helpedCount = 0;
    }

    visit: (helptime: number) => void = (helptime: number): void => {
        this.remainingTime = new Rational(helptime, this.efficiency);
        this.helpedCount++;
    };

    elapse: (time: Rational) => void = (time: Rational): void => {
        this.elapsedWorktime = Rational.add(this.elapsedWorktime, time);
        this.remainingTime = Rational.sub(this.remainingTime, time);
    };

    isProgress: () => boolean = (): boolean => {
        return this.remainingTime.numerator > 0;
    };

    isDone: () => boolean = (): boolean => {
        return this.remainingTime.numerator === 0;
    };

    canHelp: () => boolean = (): boolean => {
        return this.elapsedWorktime.calcFloat() < this.worktime;
    };

    canBreak: () => boolean = (): boolean => {
        return this.worktime <= this.elapsedWorktime.calcFloat();
    };

    break: () => void = (): void => {
        const breakTime: number = 10;
        this.elapsedWorktime = new Rational(-breakTime, 1);
        this.remainingTime = new Rational(breakTime, 1);
        this.breakCount++;
    };
}

const counters: Counter[] = efficiencies.map(efficiency => {
    return new Counter(worktime, efficiency);
});

const waitingVisitorHelptimes: number[] = [...helptimes];

counters.some(counter => {
    const helptime: number = waitingVisitorHelptimes.shift();
    if (!helptime) {
        return true;
    }

    counter.visit(helptime);
    return false;
});
const activeCounters: Counter[] = counters.filter(counter => counter.isProgress());

while (activeCounters.length > 0) {
    const elapseTime: Rational = [...activeCounters].sort((a, b) => a.remainingTime.calcFloat() - b.remainingTime.calcFloat()).at(0).remainingTime;
    activeCounters.forEach(counter => counter.elapse(elapseTime));

    const doneCounters: Counter[] = activeCounters.filter(counter => counter.isDone());
    const canNextHelpCounters: Counter[] = doneCounters.filter(counter => counter.canHelp());
    const canBreakCounters: Counter[] = doneCounters.filter(counter => counter.canBreak());

    canNextHelpCounters.forEach(counter => {
        const helptime: number = waitingVisitorHelptimes.shift();
        if (!helptime) {
            const counterIndex: number = activeCounters.indexOf(counter);
            activeCounters.splice(counterIndex, 1);
            return;
        }

        counter.visit(helptime);
    });

    canBreakCounters.forEach(counter => {
        if (waitingVisitorHelptimes.length > 0) {
            counter.break();
        } else {
            const counterIndex: number = activeCounters.indexOf(counter);
            activeCounters.splice(counterIndex, 1);
        }
    });
}

const results: string[] = [
        counters.map(counter => counter.helpedCount).join(' '),
        counters.map(counter => counter.breakCount).join(' '),
];

// console.log('answer');
results.forEach(result => {
    console.log(result);
});
