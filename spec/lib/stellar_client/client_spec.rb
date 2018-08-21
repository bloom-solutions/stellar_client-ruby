require 'spec_helper'

module StellarClient
  RSpec.describe Client, type: %i[virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:bridge_host, String) }
    end

  end
end
