# frozen_string_literal: true

require "./app"

RSpec.describe LineItem do
  describe "#total" do
    subject { line_item.total }

    context "combines our taxes and price for a total" do
      let(:line_item) { LineItem.new(quantity: 1, product: "music cd", price: 14.99) }
      it { is_expected.to eq(16.49) }
    end

    context "combines our taxes and price for a total" do
      let(:line_item) { LineItem.new(quantity: 1, product: "box of imported chocolates", price: 11.25) }
      it { is_expected.to eq(11.85) }
    end
  end

  describe "#sales_taxes" do
    subject { line_item.sales_taxes }

    context "applies 10% markup on regular products" do
      let(:line_item) { LineItem.new(quantity: 1, product: "music cd", price: 14.99) }
      it { is_expected.to eq(1.50) }
    end

    context "applies 0 markup on exclusionary items (food)" do
      let(:line_item) { LineItem.new(quantity: 1, product: "chocolate bar", price: 0.85) }
      it { is_expected.to eq(0.00) }
    end

    context "applies 5% markup on international products" do
      let(:line_item) { LineItem.new(quantity: 1, product: "imported chocolate bar", price: 10.00) }
      it { is_expected.to eq(0.50) }
    end

    context "applies 5% on international and 10% for GST" do
      let(:line_item) { LineItem.new(quantity: 1, product: "imported bottle of perfume", price: 47.50) }
      it { is_expected.to eq(7.15) }
    end

    context "combines our taxes and price for a total" do
      let(:line_item) { LineItem.new(quantity: 1, product: "box of imported chocolates", price: 11.25) }
      it { is_expected.to eq(0.65) }
    end
  end
end
