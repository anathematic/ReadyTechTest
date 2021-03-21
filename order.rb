# frozen_string_literal: true

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
end
