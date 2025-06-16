/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const expression: string = readline(); // the expression to calculate

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

interface SmallUnitConverteInformation {
    smallUnit: string;
    rate: number;
};

class MetricUnit {
    value: number;
    unit: string;

    static DIGIT_PRECISION: number = 5;
    static UNITS: string[] = ['um', 'mm', 'cm', 'dm', 'm', 'km'];

    constructor(value: number, unit: string) {
        this.value = value;
        this.unit = unit;
    }

    isUnitGreaterThan = (other: MetricUnit): boolean => {
        const selfUnitIndex: number = MetricUnit.UNITS.indexOf(this.unit);
        const otherUnitIndex: number = MetricUnit.UNITS.indexOf(other.unit);

        return otherUnitIndex < selfUnitIndex;
    };


    convertToSmallUnit = () => {
        const convertObject: { [key: string]: SmallUnitConverteInformation } = {
            'km': { 'smallUnit': 'm', 'rate': 1000 },
            'm': { 'smallUnit': 'dm', 'rate': 10 },
            'dm': { 'smallUnit': 'cm', 'rate': 10 },
            'cm': { 'smallUnit': 'mm', 'rate': 10 },
            'mm': { 'smallUnit': 'um', 'rate': 1000 },
        };

        const adjustRate: number = 10 ** MetricUnit.DIGIT_PRECISION;

        this.value = Math.round(this.value * convertObject[this.unit].rate * adjustRate) / adjustRate;
        this.unit = convertObject[this.unit].smallUnit;
    };
}

const [strLeftValue, leftUnit, strRightValue, rightUnit]: string[] = expression.match(/[\d.]+|[a-z]+/g);
const leftValue: number = parseFloat(strLeftValue);
const rightValue: number = parseFloat(strRightValue);

const leftMetric: MetricUnit = new MetricUnit(leftValue, leftUnit);
const rightMetric: MetricUnit = new MetricUnit(rightValue, rightUnit);

const bigUnitMetric: string = rightMetric.isUnitGreaterThan(leftMetric) ? 'right' : 'left';
while (leftMetric.unit !== rightMetric.unit) {
    if (bigUnitMetric === 'right') {
        rightMetric.convertToSmallUnit();
    } else {
        leftMetric.convertToSmallUnit();
    }
}

const resultValue: string = `${leftMetric.value + rightMetric.value}`.replace(/\.0+$/, '');
const result: string = `${resultValue}${leftMetric.unit}`;

// console.log('1cm');
console.log(result);

