require "spec_helper"

module StellarClient
  RSpec.describe DepositResponse, type: :virtus do
    describe "attributes" do
      subject { described_class.new }
      it { is_expected.to have_attribute(:how, String) }
      it { is_expected.to have_attribute(:eta, String) }
      it { is_expected.to have_attribute(:min_amount, BigDecimal) }
      it { is_expected.to have_attribute(:max_amount, BigDecimal) }
      it { is_expected.to have_attribute(:fee_fixed, BigDecimal) }
      it { is_expected.to have_attribute(:fee_percent, BigDecimal) }
      it { is_expected.to have_attribute(:extra_info, Hash) }
    end
  end
end
