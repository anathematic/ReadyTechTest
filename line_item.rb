# frozen_string_literal: true

class LineItem
  GST_MARKUP = 1.1
  GST_EXCLUSIONARY_LIST = /chocolate|books/

  attr_reader :description, :price, :quantity

  def initialize(description:, price:, quantity:)
    @description = description
    @price = price
    @quantity = quantity
  end

  def total_with_taxes
    description.match(GST_EXCLUSIONARY_LIST) ? price : (price * GST_MARKUP).round(2)
  end
end
