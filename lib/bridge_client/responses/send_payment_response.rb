module BridgeClient
  class SendPaymentResponse < BaseResponse

    attribute :body, Coercers::IndifferentHash, lazy: true, default: :default_body
    attribute :hash, String, lazy: true, default: :default_hash
    attribute :result_xdr, String, lazy: true, default: :default_result_xdr
    attribute :ledger, Integer, lazy: true, default: :default_ledger

    private

    def default_body
      JSON.parse(raw_response.body)
    end

    def default_hash
      body[:hash]
    end

    def default_result_xdr
      body[:result_xdr]
    end

    def default_ledger
      body[:ledger]
    end

  end
end
