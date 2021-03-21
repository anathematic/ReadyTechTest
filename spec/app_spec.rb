# frozen_string_literal: true

require "./app"

RSpec.describe "App" do
  describe "process" do
    [1, 2, 3].each do |example_number|
      let(:order) { process("./spec/fixtures/input_#{example_number}.csv") }
      let(:output) { File.read("./spec/fixtures/output_#{example_number}.csv") }

      context "imports the csv and generates a summary csv for input_#{example_number}.csv" do
        subject { File.read(order.to_receipt) }

        it { is_expected.to eq(output) }
      end
    end
  end
end
