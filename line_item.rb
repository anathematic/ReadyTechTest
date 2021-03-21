# frozen_string_literal: true

class LineItem
  GST_MARKUP = 0.10
  GST_EXCLUSIONARY_LIST = /chocolate|book/
  IMPORTED_FLAG = /imported/
  IMPORTED_MARKUP = 0.05

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

  def sales_taxes
    tax = 0
    tax =+ price * GST_MARKUP unless gst_excluded?
    tax =+ price * IMPORTED_MARKUP if imported?
    tax.round(2)
  end

  def total
    (price + sales_taxes).round(2)
  end
end
