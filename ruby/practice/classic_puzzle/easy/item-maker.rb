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
  Frame = Struct.new(
    :top_left_parts, :top_parts, :top_right_parts,
    :body_side_parts,
    :bottom_left_parts, :bottom_parts, :bottom_right_parts
  )

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
    frame = case rarity.to_sym
            when :Common then Frame.new '#', '#', '#', '#', '#', '#', '#'
            when :Rare then Frame.new '/', '#', '\\', '#', '\\', '#', '/'
            when :Epic then Frame.new '/', '-', '\\', '|', '\\', '_', '/'
            when :Legendary then Frame.new 'X', '-', 'X', '|', 'X', '_', 'X'
            end

    ascii_rows.map! { |ascii_row| "#{frame.body_side_parts} #{ascii_row} #{frame.body_side_parts}" }
    ascii_rows.unshift "#{frame.top_left_parts}#{frame.top_parts * (width - 2)}#{frame.top_right_parts}"
    ascii_rows.push "#{frame.bottom_left_parts}#{frame.bottom_parts * (width - 2)}#{frame.bottom_right_parts}"

    if rarity.to_sym == :Legendary
      name_row_index = 1
      ascii_rows[name_row_index] = "[#{ascii_rows[name_row_index][1...-1]}]"

      center_index = width / 2
      if width.even?
        ascii_rows.first[(center_index - 2)..(center_index + 1)] = '\__/'
      else
        ascii_rows.first[(center_index - 1)..(center_index + 1)] = '\_/'
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
