# frozen_string_literal: true

require "./csv_to_line_items"
require "./line_item"
require "./order"

def process(csv_path)
  line_items = CsvToLineItems.to_line_items(csv_path)
  order = Order.new(line_items)

  puts "Written to #{order.to_receipt}"
  order
end
