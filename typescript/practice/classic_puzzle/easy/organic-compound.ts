/**
 * PREFIX IN ASCENDING ORDER:
 * 'meth', 'eth', 'prop', 'but', 'pent', 'hex', 'hept', 'oct', 'non', 'dec'
 **/

const formula: string = readline();

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

class Daterminor {
    static getChemicalName: (formula: string) => string = (formula: string): string => {
        const cCount: number = this._countAtom(formula, 'C');
        const hCount: number = this._countAtom(formula, 'H');
        const oCount: number = this._countAtom(formula, 'O');

        const prefix: string = this._getPrefixName(cCount);
        const suffix: string = this._getSuffixName(formula, cCount, hCount, oCount);

        return prefix !== null && suffix !== null && this._isValidCCount(formula, oCount) ? `${prefix}${suffix}` : 'OTHERS';
    };

    static _getPrefixName: (cCount: number) => string = (cCount: number): string => {
        const prefixNames: string[] = [null, 'meth', 'eth', 'prop', 'but', 'pent', 'hex', 'hept', 'oct', 'non', 'dec'];

        return prefixNames[cCount];
    };

    static _getSuffixName: (formula: string, cCount: number, hCount: number, oCount: number) => string = (formula: string, cCount: number, hCount: number, oCount: number): string => {
        if (this._isAlkane(cCount, hCount, oCount)) {
            return 'ane';
        }

        if (this._isAlkene(cCount, hCount, oCount)) {
            return 'ene';
        }

        if (this._isAlcohol(formula, cCount, hCount)) {
            return 'anol';
        }

        if (this._isCarboxylic(formula, cCount, hCount)) {
            return 'anoic acid';
        }

        if (this._isAldehide(formula, cCount, hCount)) {
            return 'anal';
        }

        if (this._isKetone(formula, cCount, hCount)) {
            return 'anone';
        }

        return null;
    };

    static _isAlkane: (cCount: number, hCount: number, oCount: number) => boolean = (cCount: number, hCount: number, oCount: number): boolean => {
        return hCount === cCount * 2 + 2 && oCount === 0;
    };

    static _isAlkene: (cCount: number, hCount: number, oCount: number) => boolean = (cCount: number, hCount: number, oCount: number): boolean => {
        return hCount === cCount * 2 && oCount === 0;
    };

    static _isAlcohol: (formula: string, cCount: number, hCount: number) => boolean = (formula: string, cCount: number, hCount): boolean => {
        return /OH$/.test(formula) && hCount === cCount * 2 + 2;
    };

    static _isCarboxylic: (formula: string, cCount: number, hCount: number) => boolean = (formula: string, cCount: number, hCount): boolean => {
        return /COOH$/.test(formula) && hCount === cCount * 2;
    };

    static _isAldehide: (formula: string, cCount: number, hCount: number) => boolean = (formula: string, cCount: number, hCount): boolean => {
        return /CHO$/.test(formula) && hCount === cCount * 2;
    };

    static _isKetone: (formula: string, cCount: number, hCount: number) => boolean = (formula: string, cCount: number, hCount): boolean => {
        return formula.match(/CO/g)?.length === 1 && !/^CO|CO$/.test(formula) && hCount === cCount * 2;
    };

    static _isValidCCount: (formula: string, oCount: number) => boolean = (formula: string, oCount: number): boolean => {
        return oCount <= (formula.match(/COOH|OH|CHO|CO/g)?.join('')?.match(/O/g)?.length || 0);
    };

    static _countAtom: (formula: string, atom: string) => number = (formula: string, atom: string): number => {
        const matches: string[] = formula.match(new RegExp(`${atom}(?<amount>\\d*)`, 'g'));
        if (matches === null) {
            return 0;
        }

        return matches.reduce((sum, match) => sum + (match === atom ? 1 : parseInt(match.slice(atom.length), 10)), 0);
    };
}

const result: string = Daterminor.getChemicalName(formula);

// console.log('organic compound name');
console.log(result);
