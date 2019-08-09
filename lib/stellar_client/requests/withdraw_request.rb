module StellarClient
  class WithdrawRequest

    include APIClientBase::Request.module

    BODY_ATTRS = %i[
      type
      asset_code
      dest
      dest_extra
    ]
    attribute :type, String
    attribute :asset_code, String
    attribute :dest, String
    attribute :dest_extra, String

    private

    def path
      "/withdraw"
    end

    def params
      BODY_ATTRS.each_with_object({}) do |attr, hash|
        hash[attr] = send(attr)
      end
    end

  end
end
