module StellarClient
  class GetFeesResponse < BaseResponse

    attribute(:body, Coercers::IndifferentHash, {
      lazy: true,
      default: :default_body,
    })
    attribute :fee, BigDecimal, lazy: true, default: :default_fee
    attribute :error, String, lazy: true, default: :default_error

    private

    def default_body
      JSON.parse(raw_response.body)
    end

    def default_fee
      body[:fee]
    end

    def default_error
      body[:error]
    end
  end
end
