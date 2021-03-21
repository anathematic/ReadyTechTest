# frozen_string_literal: true

require "./app"

RSpec.describe LineItem do
  describe "#total_with_taxes" do
    subject { line_item.total_with_taxes }

    context "applies 10% markup on regular products" do
      let(:line_item) { LineItem.new(quantity: 1, description: "music cd", price: 14.99) }
      it { is_expected.to eq(16.49) }
    end

    context "applies 0 markup on exclusionary items (food)" do
      let(:line_item) { LineItem.new(quantity: 1, description: "chocolate bar", price: 0.85) }
      it { is_expected.to eq(0.85) }
    end
  end
end
