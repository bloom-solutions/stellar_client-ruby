require "spec_helper"

RSpec.describe "Deposting", vcr: { record: :once } do
  it "creates a deposit request" do
    client = StellarClient.new(CONFIG.slice(:host))

    response = client.deposit(
      type: "crypto",
      asset_code: "BTCT",
      account: "G-MYACCOUNT",
    )

    expect(response).to be_success

    # Note: Check spec/stellar_app/app/services/get_how.rb
    expect(response.how).to eq "1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2k"

    # From spec/stellar_app/services/get_max_amount::SAMPLE_HOT_WALLET_BALANCE
    expect(response.max_amount).to eq 1
    expect(response.min_amount).to eq 0

    # Default ETA as of stellar_base-rails 0.6.0
    expect(response.eta).to eq "600"

    expect(response.fee_percent).to be_present
    expect(response.fee_fixed).to eq 0.00001
  end
end
