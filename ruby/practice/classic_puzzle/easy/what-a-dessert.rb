# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

e, f, s, b = gets.split.map(&:to_i)

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

ingredient_counts = {
  egg: e,
  flour: f,
  sugar: s,
  butter: b
}

recipes = {
  Cookie: {
    egg: 1,
    flour: 100,
    sugar: 150,
    butter: 50
  },
  Cake: {
    egg: 3,
    flour: 180,
    sugar: 100,
    butter: 100
  },
  Muffin: {
    egg: 2,
    flour: 150,
    sugar: 100,
    butter: 150
  }
}

recipe_priority = %i[Cake Cookie Muffin]

can_make_counts = recipes.to_h do |name, require_ingredients|
  ingredient_can_make_counts = require_ingredients.map do |ingredient_name, require_count|
    ingredient_counts[ingredient_name] / require_count
  end

  [name, ingredient_can_make_counts.min]
end

max_can_make_count = can_make_counts.values.max
max_can_make_recipe_names =
  can_make_counts
  .filter { |_name, can_make_count| can_make_count == max_can_make_count }
  .keys

make_recipe_name = max_can_make_recipe_names.min_by { |name| recipe_priority.index name }

result = "#{max_can_make_count} #{make_recipe_name}"

# puts "1 Cake"
puts result
