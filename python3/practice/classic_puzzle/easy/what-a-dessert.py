# import sys
# import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

e, f, s, b = [int(i) for i in input().split()]

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

ingredient_counts = {
    'egg': e,
    'flour': f,
    'sugar': s,
    'butter': b,
}

recipes = {
    'Cookie': {
        'egg': 1,
        'flour': 100,
        'sugar': 150,
        'butter': 50,
    },
    'Cake': {
        'egg': 3,
        'flour': 180,
        'sugar': 100,
        'butter': 100,
    },
    'Muffin': {
        'egg': 2,
        'flour': 150,
        'sugar': 100,
        'butter': 150,
    },
}

recipe_priority = ['Cake', 'Cookie', 'Muffin']

can_make_counts = {}
for name, require_ingredients in recipes.items():
    ingredient_can_make_counts = [
        ingredient_counts[ingredient_name] // require_count
        for ingredient_name, require_count
        in require_ingredients.items()
    ]

    can_make_counts[name] = min(ingredient_can_make_counts)

max_can_make_count = max(can_make_counts.values())
max_can_make_recipe_names = [
    name
    for name, can_make_count
    in can_make_counts.items()
    if can_make_count == max_can_make_count
]

make_recipe_name = next(iter(
    recipe_name
    for recipe_name
    in recipe_priority
    if recipe_name in max_can_make_recipe_names
))

result = f'{max_can_make_count} {make_recipe_name}'

# print("1 Cake")
print(result)
