module StellarClient
  class WithdrawRequest

    include APIClientBase::Request.module

    BODY_ATTRS = %i[
      type
      asset_code
      dest
    ]
    attribute :type, String
    attribute :asset_code, String
    attribute :dest, String

    private

    def path
      [Addressable::URI.parse(host).path, "/withdraw"].join
    end

    def params
      BODY_ATTRS.each_with_object({}) do |attr, hash|
        hash[attr] = send(attr)
      end
    end

  end
end
