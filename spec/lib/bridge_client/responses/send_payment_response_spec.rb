require 'spec_helper'

module BridgeClient
  RSpec.describe SendPaymentResponse, type: %i[virtus] do

    it "inherits from BaseResponse" do
      expect(SendPaymentResponse < BaseResponse).to be true
    end

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:body) }
      it { is_expected.to have_attribute(:hash, String) }
      it { is_expected.to have_attribute(:result_xdr, String) }
      it { is_expected.to have_attribute(:ledger, Integer) }
      it { is_expected.to have_attribute(:code_str, String) }
      it { is_expected.to have_attribute(:message, String) }
    end

    describe "#body" do
      let(:raw_response) do
        instance_double(Typhoeus::Response, body: {hi: "there"}.to_json)
      end
      let(:response) { described_class.new(raw_response: raw_response) }

      it "is the parsed body of the raw_response" do
        expect(response.body[:hi]).to eq "there"
      end
    end

    describe "#hash" do
      let(:response) { described_class.new(body: {hash: "hash"}) }
      it "is the body's hash" do
        expect(response.hash).to eq "hash"
      end
    end

    describe "#result_xdr" do
      let(:response) { described_class.new(body: {result_xdr: "result_xdr"}) }
      it "is the body's result_xdr" do
        expect(response.result_xdr).to eq "result_xdr"
      end
    end

    describe "#ledger" do
      let(:response) { described_class.new(body: {ledger: 292}) }
      it "is the body's ledger" do
        expect(response.ledger).to eq 292
      end
    end

    describe "#code_str" do
      let(:response) { described_class.new(body: {code: "payment_underfunded"}) }
      it "is the body's code" do
        expect(response.code_str).to eq "payment_underfunded"
      end
    end

    describe "#message" do
      let(:response) { described_class.new(body: {message: "Hi"}) }
      it "is the body's message" do
        expect(response.message).to eq "Hi"
      end
    end

  end
end
