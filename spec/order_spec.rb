# frozen_string_literal: true

require "./app"

RSpec.describe Order do
  let(:line_items) do
    [
      { quantity: 1, description: "book", price: 12.49 },
      { quantity: 1, description: "chocolates", price: 0.85 }
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
end
