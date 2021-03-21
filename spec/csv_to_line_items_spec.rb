# frozen_string_literal: true

require "./app"

RSpec.describe CsvToLineItems do
  describe ".to_line_items" do
    subject { CsvToLineItems.to_line_items("./spec/fixtures/input_1.csv") }

    context "Generates an array of Line Item hashes which are allow listed" do
      it do
        is_expected.to eq([
          { quantity: 1, product: "book", price: 12.49 },
          { quantity: 1, product: "music cd", price: 14.99 },
          { quantity: 1, product: "chocolate bar", price: 0.85 },
        ])
      end
    end
  end
end
