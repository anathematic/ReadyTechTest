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

  def to_receipt
    filename = Time.now.strftime("%Y-%m-%d-%H-%M-%S")

    output = CSV.open("./public/#{filename}.csv", "wb") do |csv|
      line_items.each do |line_item|
        csv << [line_item.quantity.to_i, line_item.product, to_currency_s(line_item.total)]
      end

      csv << []
      csv << ["Sales Taxes: #{to_currency_s(sales_taxes)}"]
      csv << ["Total: #{to_currency_s(total)}"]
    end

    output.path
  end

  private

  def to_currency_s(amount)
    sprintf("%.2f", amount)
  end
end
