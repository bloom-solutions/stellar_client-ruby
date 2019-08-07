module StellarClient
  class GetFeesResponse < BaseResponse

    attribute(:body, Coercers::IndifferentHash, {
      lazy: true,
      default: :default_body,
    })
    attribute :fee, BigDecimal, lazy: true, default: :default_fee

    private

    def default_body
      JSON.parse(raw_response.body)
    end

    def default_fee
      body[:fee]
    end

  end
end
