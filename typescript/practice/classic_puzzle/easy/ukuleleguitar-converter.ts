/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

const mode: string = readline();
const n: number = parseInt(readline());
const stringFrets: [number, number][] = [];
for (let i = 0; i < n; i++) {
    const inputs: string[] = readline().split(' ');
    const string: number = parseInt(inputs[0]);
    const fret: number = parseInt(inputs[1]);

    stringFrets.push([string, fret]);
}
// for (let i = 0; i < n; i++) {
//
//     // Write an answer using console.log()
//     // To debug: console.error('Debug messages...');
//
//     console.log('string1/fret1 string2/fret2...');
// }

interface Instrument {
    strings: string[];
    fretSize: number;
};

class Converter {
    static NOTE_PATTERN: string[] = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'];

    static UKULELE: Instrument = { strings: ['A4', 'E4', 'C4', 'G4'], fretSize: 15 };
    static GUITAR: Instrument = { strings: ['E4', 'B3', 'G3', 'D3', 'A2', 'E2'], fretSize: 21 };

    static convert: (fromInstrumentName: string, stringNum: number, fromFret: number) => string = (fromInstrumentName: string, stringNum: number, fromFret: number): string => {
        const [fromInstrument, toInstrument]: [Instrument, Instrument] = fromInstrumentName === 'guitar' ? [this.GUITAR, this.UKULELE] : [this.UKULELE, this.GUITAR];

        const fromString: string = fromInstrument.strings[stringNum];
        const fromNoteNum: number = this.#calcNoteNum(fromString, fromFret);

        const convertedNotes: string[] = toInstrument.strings.map((toString, toStringIndex) => {
            const toNoteNum: number = this.#calcNoteNum(toString, 0);
            const toFret: number = fromNoteNum - toNoteNum;
            if (toFret < 0 || toInstrument.fretSize < toFret) {
                return null;
            }

            return `${toStringIndex}/${toFret}`;
        }).filter(convertedNote => convertedNote !== null);

        return convertedNotes.length > 0 ? convertedNotes.join(' ') : 'no match';
    };

    static #calcNoteNum: (string: string, fret: number) => number = (string: string, fret: number): number => {
        const [noteCode, noteNumStr]: string[] = string.split('');
        const noteNum: number = parseInt(noteNumStr);

        return noteNum * this.NOTE_PATTERN.length + this.NOTE_PATTERN.indexOf(noteCode) + fret;
    };
}

const results: string[] = stringFrets.map(([string, fret]) => {
    return Converter.convert(mode, string, fret);
});

results.forEach(result => {
    console.log(result);
});
