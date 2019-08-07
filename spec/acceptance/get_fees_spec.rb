require "spec_helper"

RSpec.describe "Get fees", vcr: { record: :once } do
  it "makes a GET /fee request" do
    client = StellarClient.new(CONFIG.slice(:host))

    response = client.get_fees(
      asset_code: "BTCT",
      operation: "deposit",
      amount: 0.001,
    )

    expect(response).to be_success
    expect(response.fee).to be_a BigDecimal
    expect(response.fee).not_to be_nil
  end
end
