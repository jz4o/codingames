/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const n: number = parseInt(readline());
const numbers: string[] = [];
for (let i = 0; i < n; i++) {
    const x: string = readline();

    numbers.push(x);
}

// Write an answer using console.log()
// To debug: console.error('Debug messages...');

const howToRead = (numberStr: string) => {
    if (numberStr.substring(0, 1) === '-') {
        return `negative ${howToRead(numberStr.substring(1))}`;
    }

    if (numberStr.length >= 4) {
        const overThousandUnitNames: string[] = ['', 'thousand', 'million', 'billion', 'trillion', 'quadrillion', 'quintillion'];

        const numberSize: number = numberStr.length;
        const unitNumberSize: number = numberSize % 3 === 0 ? 3 : numberSize % 3;
        const modNumberSize: number = numberSize - unitNumberSize;

        const unitNumber: string = numberStr.substring(0, unitNumberSize);
        const modNumber: string = numberStr.substring(unitNumberSize);

        let result: string = '';
        result += `${howToRead(unitNumber)} ${overThousandUnitNames[Math.floor(modNumberSize / 3)]}`;
        if (!modNumber.match(/^0+$/)) {
            result += ` ${howToRead(modNumber)}`;
        }

        return result;
    }

    let result: string = '';
    const number: number = Number(numberStr);
    if (number >= 100) {
        const hundredUnit: number = Math.floor(number / 100);
        const modUnit: number = number % 100;

        if (hundredUnit > 0) {
            result += `${howToRead(String(hundredUnit))} hundred`;
        }
        if (modUnit > 0) {
            result += ` ${howToRead(String(modUnit))}`;
        }
    } else if (number >= 20) {
        const tenUnitNames: string[] = ['', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'];
        const tenUnit: number = Math.floor(number / 10);
        const modUnit: number = number % 10;

        if (tenUnit > 0) {
            result += tenUnitNames[tenUnit];
        }
        if (modUnit > 0) {
            result += `-${howToRead(String(modUnit))}`;
        }
    } else {
        const underTwentyNames: string[] = [
            'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten',
            'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'
        ];

        result = underTwentyNames[number];
    }

    return result.trim();
}

const results: string[] = numbers.map(number => howToRead(number));

// console.log('cardinal');
results.forEach(result => {
    console.log(result);
});
