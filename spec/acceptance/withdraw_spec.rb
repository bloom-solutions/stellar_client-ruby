require "spec_helper"

RSpec.describe "Withdrawing", vcr: { record: :once } do
  it "creates a withdrawal request" do
    client = StellarClient.new(CONFIG.slice(:host))

    response = client.withdraw(
      type: "crypto",
      asset_code: "BTCT",
      dest: "my-btc-address",
    )

    expect(response).to be_success
    expect(response.account_id).to be_present
    expect(response.memo).to be_present
    expect(response.memo_type).to be_present
    expect(response.min_amount).to be_present
    expect(response.fee_percent).to be_present
    expect(response.fee_fixed).to be_present

    # From spec/stellar_app/services/get_max_amount::SAMPLE_HOT_WALLET_BALANCE
    expect(response.max_amount).to eq 1
  end
end
