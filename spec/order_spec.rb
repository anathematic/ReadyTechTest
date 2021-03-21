# frozen_string_literal: true

require "./app"

RSpec.describe Order do
  let(:line_items) do
    [
      { quantity: 1, product: "book", price: 12.49 },
      { quantity: 1, product: "music cd", price: 14.99 },
      { quantity: 1, product: "chocolate bar", price: 0.85 }
    ]
  end

  let(:order) { Order.new(line_items) }

  describe "#total" do
    subject { order.total }

    it { is_expected.to eq(29.83) }
  end

  describe "#sales_taxes" do
    subject { order.sales_taxes }

    it { is_expected.to eq(1.5) }
  end

  describe "#to_receipt" do
    let(:output) { File.read("./spec/fixtures/output_1.csv") }

    subject { File.read(order.to_receipt) }

    it { is_expected.to eq(output) }
  end
end
