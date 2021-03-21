# frozen_string_literal: true

class LineItem
  GST_MARKUP = 0.10
  GST_EXCLUSIONARY_LIST = /book|chocolate|pills/
  IMPORTED_FLAG = /imported/
  IMPORTED_MARKUP = 0.05

  attr_reader :price, :product, :quantity

  def initialize(product:, price:, quantity:)
    @product = product
    @price = price
    @quantity = quantity
  end

  def gst_excluded?
    product.match?(GST_EXCLUSIONARY_LIST)
  end

  def imported?
    product.match?(IMPORTED_FLAG)
  end

  def sales_taxes
    tax = 0
    tax += price * GST_MARKUP unless gst_excluded?
    tax += price * IMPORTED_MARKUP if imported?

    # Rounding to the nearest 10 unit,
    #   eg: 1266.ceil(-1) => 1270
    (tax * 100).ceil(-1) / 100.0
  end

  def total
    (price + sales_taxes).round(2)
  end
end
