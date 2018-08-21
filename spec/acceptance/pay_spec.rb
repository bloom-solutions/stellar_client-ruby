require 'spec_helper'

RSpec.describe "Sending payments", vcr: {record: :once} do

  context "payment is successful" do
    it "returns the response with the transaction and ledger info" do
      client = StellarClient.new
      response = client.send_payment(
        CONFIG.slice(:destination, :source).merge(
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

  context "payment is not successful" do
    it "returns the response with the code and message" do
      client = StellarClient.new
      response = client.send_payment(
        CONFIG.slice(:destination, :source).merge(amount: 100_000_000_000)
      )

      expect(response).to_not be_success
      expect(response.code_str).to eq "payment_underfunded"
      expect(response.message).to eq "Not enough funds to send this transaction."
    end
  end

end
