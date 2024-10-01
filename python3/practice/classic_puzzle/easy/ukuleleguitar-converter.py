# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

mode = input()
n = int(input())
string_frets = []
for _ in range(n):
    string, fret = [int(j) for j in input().split()]
    string_frets.append((string, fret))
# for i in range(n):
#
#     # Write an answer using print
#     # To debug: print("Debug messages...", file=sys.stderr, flush=True)
#
#     print("string1/fret1 string2/fret2...")

class Converter:
    NOTE_PATTERN = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B']

    class Instrument:
        def __init__(self, strings, fret_size):
            self.strings = strings
            self.fret_size = fret_size

    UKULELE = Instrument(['A4', 'E4', 'C4', 'G4'], 15)
    GUITAR = Instrument(['E4', 'B3', 'G3', 'D3', 'A2', 'E2'], 21)

    @classmethod
    def convert(cls, from_instrument_name, string_num, from_fret):
        from_instrument, to_instrument = (
            [cls.GUITAR, cls.UKULELE] if from_instrument_name == 'guitar' else [cls.UKULELE, cls.GUITAR]
        )

        from_string = from_instrument.strings[string_num]
        from_note_num = cls.__calc_note_num(from_string, from_fret)

        converted_notes = []
        for to_string_index, to_string in enumerate(to_instrument.strings):
            to_note_num = cls.__calc_note_num(to_string, 0)
            to_fret = from_note_num - to_note_num
            if not 0 <= to_fret <= to_instrument.fret_size:
                continue

            converted_notes.append(f'{to_string_index}/{to_fret}')

        return ' '.join(converted_notes) if len(converted_notes) > 0 else 'no match'

    @classmethod
    def __calc_note_num(cls, string, fret):
        note_code, note_num = list(string)
        note_num = int(note_num)

        return note_num * len(cls.NOTE_PATTERN) + cls.NOTE_PATTERN.index(note_code) + fret

results = [
    Converter.convert(mode, string, fret)
    for string, fret
    in string_frets
]

for result in results:
    print(result)
