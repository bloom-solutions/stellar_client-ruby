module StellarClient
  class DepositRequest

    include APIClientBase::Request.module

    BODY_ATTRS = %i[
      account
      asset_code
      memo
      memo_type
      email_address
      type
    ]
    attribute :account, String
    attribute :asset_code, String
    attribute :memo, String
    attribute :memo_type, String
    attribute :email_address, String
    attribute :type, String

    private

    def path
      [Addressable::URI.parse(host).path, "/deposit"].join
    end

    def params
      BODY_ATTRS.each_with_object({}) do |attr, hash|
        hash[attr] = send(attr)
      end
    end

  end
end
