# frozen_string_literal: true

require "./order"

RSpec.describe Order do
  describe "can initialise" do
    context "can create a new instance of Order" do
      subject { Order.new.class }

      it { is_expected.to eq(Order) }
    end
  end
end
