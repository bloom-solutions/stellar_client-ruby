require 'spec_helper'

RSpec.describe "Sending payments", vcr: {record: :once} do

  it "posts to /payments" do
    client = BridgeClient.new
    response = client.send_payment(
      CONFIG.slice(:destination, :asset_issuer).merge(
        amount: 1,
        memo_type: "text",
        memo: "My memo",
      )
    )

    expect(response).to be_success
    expect(response.hash).to be_present
    expect(response.result_xdr).to be_present
    expect(response.ledger).to be_an Integer
  end

end
