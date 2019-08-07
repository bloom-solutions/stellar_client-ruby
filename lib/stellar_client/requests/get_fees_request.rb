module StellarClient
  class GetFeesRequest

    include APIClientBase::Request.module

    BODY_ATTRS = %i[
      amount
      asset_code
      operation
      type
    ]
    attribute :amount, BigDecimal
    attribute :asset_code, String
    attribute :operation, String
    attribute :type, String

    private

    def path
      "/fee"
    end

    def params
      BODY_ATTRS.each_with_object({}) do |attr, hash|
        hash[attr] = send(attr)
      end
    end

  end
end
