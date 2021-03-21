# frozen_string_literal: true

class LineItem
  GST_MARKUP = 1.1
  GST_EXCLUSIONARY_LIST = /chocolate|books/
  IMPORTED_FLAG = /imported/
  IMPORTED_MARKUP = 1.05

  attr_reader :description, :price, :quantity

  def initialize(description:, price:, quantity:)
    @description = description
    @price = price
    @quantity = quantity
  end

  def gst_excluded?
    description.match?(GST_EXCLUSIONARY_LIST)
  end

  def imported?
    description.match?(IMPORTED_FLAG)
  end

  def total_with_taxes
    total = price
    total = total * GST_MARKUP unless gst_excluded?
    total = total * IMPORTED_MARKUP if imported?
    total.round(2)
  end
end
