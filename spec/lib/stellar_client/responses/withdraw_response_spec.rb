require "spec_helper"

module StellarClient
  RSpec.describe WithdrawResponse, type: :virtus do
    describe "attributes" do
      subject { described_class.new }
      it { is_expected.to have_attribute(:account_id, String) }
      it { is_expected.to have_attribute(:memo_type, String) }
      it { is_expected.to have_attribute(:memo, String) }
      it { is_expected.to have_attribute(:min_amount, BigDecimal) }
      it { is_expected.to have_attribute(:fee_fixed, BigDecimal) }
      it { is_expected.to have_attribute(:fee_percent, BigDecimal) }
      it { is_expected.to have_attribute(:fee_network, BigDecimal) }
    end
  end
end
