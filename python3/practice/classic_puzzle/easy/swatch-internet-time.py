# import sys
# import math

from __future__ import annotations

import re
from decimal import ROUND_HALF_UP, Decimal

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

rawtime = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

def precise_round_div(dividend: float, divisor: float, ndigits: int | None = None) -> float:
    div_decimal = Decimal(str(dividend)) / Decimal(str(divisor))

    if ndigits is None:
        return float(div_decimal)

    adjust_decimal = Decimal(str(10 ** -ndigits))
    rounded_decimal = (div_decimal / adjust_decimal).quantize(Decimal('0'), ROUND_HALF_UP) * adjust_decimal

    return float(rounded_decimal)


time_regex = r'(\d{2}):(\d{2}):(\d{2})\sUTC([+-])(\d{2}):(\d{2})'
hh, mm, ss, utc_sign, utc_hh, utc_mm = next(iter(re.findall(time_regex, rawtime)))
raw_seconds = int(hh) * 3600 + int(mm) * 60 + int(ss)

utc_minutes = (int(utc_hh) * 60 + int(utc_mm)) * (1 if utc_sign == '+' else -1)
biel_diff_seconds = (60 - utc_minutes) * 60
biel_seconds = (raw_seconds + biel_diff_seconds) % (60 * 60 * 24)

beats = precise_round_div(biel_seconds, 86.4, 2)

result = f'@{beats:.2f}'

# print("answer")
print(result)
