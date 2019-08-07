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

  it "makes a wrong GET /fee request" do
    client = StellarClient.new(CONFIG.slice(:host))

    response = client.get_fees(
      asset_code: "BZST",
      operation: "depozist",
    )

    expect(response).not_to be_success

    errors = response.error
    expect(errors["amount"]).to include "can't be blank"
    expect(errors["operation"]).to include "depozist is not a valid operation"
    expect(errors["asset_code"])
      .to include "invalid asset_code. Valid asset_codes: BTCT"
  end
end
