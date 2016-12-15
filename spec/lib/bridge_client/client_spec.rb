require 'spec_helper'

module BridgeClient
  RSpec.describe Client, type: %i[virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:host, String) }
    end

  end
end
