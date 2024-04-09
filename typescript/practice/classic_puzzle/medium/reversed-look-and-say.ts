/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const s: string = readline();

const sliceN = <T>(array: T[], sliceSize: number): T[][] => {
    const result: T[][] = [];

    let startIndex = 0;
    while (startIndex < array.length) {
        result.push(array.slice(startIndex, startIndex + sliceSize));
        startIndex += sliceSize;
    }

    return result;
};

const isEncodable = (str: string): boolean => {
    return encode(str) && encode(str) !== str;
};

const encode = (str: string): string => {
    if (str.length % 2 !== 0) {
        return;
    }

    const result: string = sliceN(str.split(''), 2).reduce((result, values) => {
        const count: number = parseInt(values[0]);
        const value: string = values[1];

        return result + value.repeat(count);
    }, '');

    return isDecodable(result, str) ? result : null;
};

const isDecodable = (encodedStr: string, originalStr: string): boolean => {
    let result: string = '';
    while (encodedStr.length !== 0) {
        const char: string = encodedStr[0];
        const charGroup: string = encodedStr.match(new RegExp(`^${char}+`)).toString();
        encodedStr = encodedStr.substring(charGroup.length);
        result += charGroup.length + char;
    }

    return result === originalStr;
};

let result: string = s;
while (isEncodable(result)) {
    result = encode(result);
}

console.log(result);
