# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

data = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Item
  attr_reader :name, :rarity, :attributes

  def initialize(name, rarity, *attributes)
    @name = name
    @rarity = rarity
    @attributes = attributes
  end
end

class ItemInterface
  def self.create_ascii(item)
    ascii_rows = create_ascii_rows item
    surround_with_frame ascii_rows, item.rarity
  end

  def self.create_ascii_rows(item)
    name = "-#{item.name}-"
    rarity = item.rarity
    attributes = item.attributes

    width = [name, rarity, *attributes].map(&:length).max

    name_space_size = width - name.length
    rarity_space_size = width - rarity.length

    ascii_rows = []
    ascii_rows << (name_space_size.even? ? name.center(width) : " #{name.center(width)[...-1]}")
    ascii_rows << (rarity_space_size.even? ? rarity.center(width) : " #{rarity.center(width)[...-1]}")
    ascii_rows.concat(item.attributes.map { |attribute| attribute.sub(':', ' ').ljust width })
  end
  private_class_method :create_ascii_rows

  def self.surround_with_frame(ascii_rows, rarity)
    width = ascii_rows.first.length + (2 * 2)

    case rarity.to_sym
    when :Common
      ascii_rows.map! do |ascii_row|
        "# #{ascii_row} #"
      end
      ascii_rows.unshift '#' * width
      ascii_rows.push '#' * width

    when :Rare
      ascii_rows.map! do |ascii_row|
        "# #{ascii_row} #"
      end
      ascii_rows.unshift "/#{'#' * (width - 2)}\\"
      ascii_rows.push "\\#{'#' * (width - 2)}/"

    when :Epic
      ascii_rows.map! do |ascii_row|
        "| #{ascii_row} |"
      end
      ascii_rows.unshift "/#{'-' * (width - 2)}\\"
      ascii_rows.push "\\#{'_' * (width - 2)}/"

    when :Legendary
      ascii_rows.map! do |ascii_row|
        "| #{ascii_row} |"
      end
      ascii_rows.first[0] = '['
      ascii_rows.first[-1] = ']'

      ascii_rows.unshift "X#{'-' * (width - 2)}X"
      ascii_rows.push "X#{'_' * (width - 2)}X"

      center_index = width / 2
      if width.even?
        ascii_rows.first[center_index - 2..center_index + 1] = '\__/'
      else
        ascii_rows.first[center_index - 1..center_index + 1] = '\_/'
      end
    end

    ascii_rows
  end
  private_class_method :surround_with_frame
end

item = Item.new(*data.split(','))
results = ItemInterface.create_ascii item

# puts "A ready-to-play item!"
results.each do |result|
  puts result
end
