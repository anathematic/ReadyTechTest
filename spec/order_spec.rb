# frozen_string_literal: true

require "./app"

RSpec.describe Order do
  let(:line_items) do
    [
      { quantity: 1, product: "book", price: 12.49 },
      { quantity: 1, product: "chocolates", price: 0.85 }
    ]
  end

  let(:order) { Order.new(line_items) }

  describe "#total" do
    subject { order.total }

    it { is_expected.to eq(13.34) }
  end

  describe "#sales_taxes" do
    subject { order.sales_taxes }

    it { is_expected.to eq(0) }
  end

  describe ".from_csv" do
    let(:order) { Order.from_csv("./spec/fixtures/input_1.csv") }

    context "initialize an order from a CSV file" do
      subject { order.total }

      it { is_expected.to eq(29.83) }
    end
  end
end
