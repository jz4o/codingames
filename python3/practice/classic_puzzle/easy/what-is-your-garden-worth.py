# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

num_of_lines_of_offering_statement = int(input())
offers = []
for _ in range(num_of_lines_of_offering_statement):
    offer = input()
    offers.append(offer)
garden_height = int(input())
garden_rows = []
for _ in range(garden_height):
    garden_row = input()
    garden_rows.append(garden_row)

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

offer_dict = {}
for offer in offers:
    amount_str, emojis = offer.split(' = ')
    amount = int(amount_str.removeprefix('$'))

    for emoji in emojis:
        offer_dict[ord(emoji)] = amount

worth = sum(offer_dict.get(ord(c), 0) for c in ''.join(garden_rows))

result = f'${worth:,}'

# print("worth")
print(result)
