require 'spec_helper'

RSpec.describe "#get_toml" do

  it "fetches the toml file", vcr: {record: :once} do
    client = StellarClient.new(CONFIG.slice(:host))
    response = client.get_toml

    toml = response.toml

    expect(response).to be_success
    expect(toml["TRANSFER_SERVER"]).to eq "http://localhost:3000/stellar"
  end

end
