# frozen_string_literal: true

require "csv"

class Order
  attr_accessor :line_items

  def initialize(line_items)
    @line_items = line_items.map { |li| LineItem.new(**li) }
  end

  def sales_taxes
    line_items.sum(&:sales_taxes)
  end

  def total
    line_items.sum(&:total)
  end

  def self.from_csv(csv_path)
    line_items = CsvToLineItems.to_line_items(csv_path)
    new line_items
  end
end
