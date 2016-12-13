require "spec_helper"

describe BridgeClient do
  it "has a version number" do
    expect(BridgeClient::VERSION).not_to be nil
  end

  it "is configurable" do
    described_class.configure do |c|
      c.host = "http://abc.com"
    end

    expect(described_class.configuration.host).to eq "http://abc.com"
  end
end
